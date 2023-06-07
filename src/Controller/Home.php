<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Pages;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Persistence\ManagerRegistry;

class Home extends AbstractController
{
    public function index(Request $request): Response
    {
        return $this->render('views/home.html.twig');
    }

    public function page(String $slug, ManagerRegistry $doctrine): Response{
        $page = $doctrine->getRepository(Pages::class)->findOneBy(['slug' => $slug]);

        if ($page === null) {
            throw $this->createNotFoundException(
                'No product found for id '
            );
        }

        $type = $page->getType();
        
        if ($type === 'gallery') {
            return $this->render('views/gallery.html.twig', ['page' => $page]);
        }else if($type === 'page'){
            return $this->render('views/page.html.twig', ['page' => $page]);
        }else if($type === 'page-submenu'){
            return $this->render('views/page-submenu.html.twig', ['page' => $page]);
        }else{
            return $this->render('views/error.html.twig', ['page' => $page]);
        }
    }
}
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

    public function pages(String $slug, ManagerRegistry $doctrine): Response{
        $page = $doctrine->getRepository(Pages::class)->findOneBy(['slug' => $slug]);

        if ($page === null) {
            throw $this->createNotFoundException(
                'No product found for id '
            );
        }

        return $this->render('views/page.html.twig', ['page' => $page]);
    }
}
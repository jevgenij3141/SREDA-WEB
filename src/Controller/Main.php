<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class Main extends AbstractController
{
    public function index(): Response
    {
        return $this->render('index.html.twig');
    }

    public function pages(): Response{
        return $this->render('views/page.html.twig');
    }
}
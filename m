From: andy.shevchenko@gmail.com (Andy Shevchenko)
Date: Thu, 20 Jun 2019 22:50:17 +0300
Subject: [Linux-kernel-mentees] [PATCH v2] Documentation: platform:
	Delete x86-laptop-drivers.txt
In-Reply-To: <20190620183827.23704-1-puranjay12@gmail.com>
References: <20190620183827.23704-1-puranjay12@gmail.com>
Message-ID:
 <CAHp75Ve+v7o=Ar=5Vc7yZndCxUNf3sn8YwpCHXMwdeJxuLKMoA@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190620195017.Pt96bLue3Yfsbp_mWCeKaRmI-UgB2cBFHtNcNpoVgbY@z>

On Thu, Jun 20, 2019 at 9:38 PM Puranjay Mohan <puranjay12 at gmail.com> wrote:
>
> The list of laptops supported by drivers in PDx86 subsystem is quite
> big and growing. x86-laptop-drivers.txt contains details of very few
> laptop models. Remove it because it does not  serve any purpose.
>

Acked-by: Andy Shevchenko <andy.shevchenko at gmail.com>

> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  Documentation/platform/x86-laptop-drivers.txt | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 Documentation/platform/x86-laptop-drivers.txt
>
> diff --git a/Documentation/platform/x86-laptop-drivers.txt b/Documentation/platform/x86-laptop-drivers.txt
> deleted file mode 100644
> index 01facd2590bb..000000000000
> --- a/Documentation/platform/x86-laptop-drivers.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -compal-laptop
> -=============
> -List of supported hardware:
> -
> -by Compal:
> -       Compal FL90/IFL90
> -       Compal FL91/IFL91
> -       Compal FL92/JFL92
> -       Compal FT00/IFT00
> -
> -by Dell:
> -       Dell Vostro 1200
> -       Dell Mini 9 (Inspiron 910)
> -       Dell Mini 10 (Inspiron 1010)
> -       Dell Mini 10v (Inspiron 1011)
> -       Dell Mini 1012 (Inspiron 1012)
> -       Dell Inspiron 11z (Inspiron 1110)
> -       Dell Mini 12 (Inspiron 1210)
> --
> 2.21.0
>


-- 
With Best Regards,
Andy Shevchenko

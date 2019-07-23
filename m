From: bjorn.helgaas at gmail.com (Bjorn Helgaas)
Date: Tue, 23 Jul 2019 17:56:04 -0500
Subject: [Linux-kernel-mentees] [PATCH v2] drivers: net: xgene: Remove
	acpi_has_method() calls
In-Reply-To: <20190723185811.8548-1-skunberg.kelsey@gmail.com>
References: <20190722030401.69563-1-skunberg.kelsey@gmail.com>
	<20190723185811.8548-1-skunberg.kelsey@gmail.com>
Message-ID: <CABhMZUVAcJwJpN8BKZTTU7jUW6881KdBtoYs_3kSn+tDtOVqNw@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Jul 23, 2019 at 1:59 PM Kelsey Skunberg
<skunberg.kelsey at gmail.com> wrote:
>
> acpi_evaluate_object will already return an error if the needed method
> does not exist. Remove unnecessary acpi_has_method() calls and check the
> returned acpi_status for failure instead.

> diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c b/drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c
> index 6453fc2ebb1f..5d637b46b2bf 100644
> --- a/drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c
> +++ b/drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c
> @@ -437,6 +437,7 @@ static void xgene_sgmac_tx_disable(struct xgene_enet_pdata *p)
>  static int xgene_enet_reset(struct xgene_enet_pdata *p)
>  {
>         struct device *dev = &p->pdev->dev;
> +       acpi_status status;
>
>         if (!xgene_ring_mgr_init(p))
>                 return -ENODEV;
> @@ -460,14 +461,13 @@ static int xgene_enet_reset(struct xgene_enet_pdata *p)
>                 }
>         } else {
>  #ifdef CONFIG_ACPI
> -               if (acpi_has_method(ACPI_HANDLE(&p->pdev->dev), "_RST"))
> -                       acpi_evaluate_object(ACPI_HANDLE(&p->pdev->dev),
> -                                            "_RST", NULL, NULL);
> -               else if (acpi_has_method(ACPI_HANDLE(&p->pdev->dev), "_INI"))
> +               status = acpi_evaluate_object(ACPI_HANDLE(&p->pdev->dev),
> +                                             "_RST", NULL, NULL);
> +               if (ACPI_FAILURE(status)) {
>                         acpi_evaluate_object(ACPI_HANDLE(&p->pdev->dev),
>                                              "_INI", NULL, NULL);
> +               }
>  #endif
> -       }

Oops, I don't think you intended to remove that brace.

If you haven't found it already, CONFIG_COMPILE_TEST is useful for
building things that wouldn't normally be buildable on your arch.

>         if (!p->port_id) {
>                 xgene_enet_ecc_init(p);

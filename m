Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8358DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 09:16:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EEBB22CA1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 09:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uF4e6hYm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EEBB22CA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0CC4C84F69;
	Wed,  5 Aug 2020 09:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTk1DeFY-rqE; Wed,  5 Aug 2020 09:16:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 739D884EED;
	Wed,  5 Aug 2020 09:16:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63DB4C0051;
	Wed,  5 Aug 2020 09:16:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E30E8C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 09:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C2D8E2044E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 09:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKSsy-1-V1Lf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 09:16:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id AD063203F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 09:16:24 +0000 (UTC)
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CFED22CAD;
 Wed,  5 Aug 2020 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596618984;
 bh=6O7veydzBrM6sXobxfIvfoVXBBW16AKGxY6J+cRtiOE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uF4e6hYmUzTKbbX1X6ftpR3hJ1oyFmUZyry0CYnxJ61CFg/vTGRPqJ3CNiCe/+Lmo
 3NlgmX1gUHe+57UHMt2MGsX6azy+2cq98fCQ+tw/j4lMQdzFtTL0OQ2E7VtifcvHQY
 bQsExseQi3ENrDd8U9Bd/wCX+LDmeZQVUdxoKJzs=
Date: Wed, 5 Aug 2020 11:16:22 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200805091622.GH1229@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20200720140031.511830-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200720140031.511830-1-vaibhavgupta40@gmail.com>
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, linux-i2c@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] i2c: eg20t: use generic power
	management
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4948684065383184789=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============4948684065383184789==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nFBW6CQlri5Qm8JQ"
Content-Disposition: inline


--nFBW6CQlri5Qm8JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 07:30:32PM +0530, Vaibhav Gupta wrote:
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
>=20
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
>=20
> This driver makes use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(),
> pci_enable_wake() and pci_set_power_state() to do required operations. In
> generic mode, they are no longer needed.
>=20
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
> "struct pci_dev*" variable and drv data.
>=20
> Compile-tested only.
>=20
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Looks reasonable, but to make sure I'd like a test from someone with HW
or an ack from someone more experienced with PCI details.

> ---
>  drivers/i2c/busses/i2c-eg20t.c | 39 ++++++++--------------------------
>  1 file changed, 9 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20=
t.c
> index 73f139690e4e..c0ddc4cc2ce7 100644
> --- a/drivers/i2c/busses/i2c-eg20t.c
> +++ b/drivers/i2c/busses/i2c-eg20t.c
> @@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
>  	kfree(adap_info);
>  }
> =20
> -#ifdef CONFIG_PM
> -static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused pch_i2c_suspend(struct device *dev)
>  {
> -	int ret;
>  	int i;
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
>  	struct adapter_info *adap_info =3D pci_get_drvdata(pdev);
>  	void __iomem *p =3D adap_info->pch_data[0].pch_base_address;
> =20
> @@ -872,34 +871,17 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm=
_message_t state)
>  		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
>  		ioread32(p + PCH_I2CESRSTA));
> =20
> -	ret =3D pci_save_state(pdev);
> -
> -	if (ret) {
> -		pch_pci_err(pdev, "pci_save_state\n");
> -		return ret;
> -	}
> -
> -	pci_enable_wake(pdev, PCI_D3hot, 0);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> +	device_wakeup_disable(dev);
> =20
>  	return 0;
>  }
> =20
> -static int pch_i2c_resume(struct pci_dev *pdev)
> +static int __maybe_unused pch_i2c_resume(struct device *dev)
>  {
>  	int i;
> -	struct adapter_info *adap_info =3D pci_get_drvdata(pdev);
> -
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_restore_state(pdev);
> +	struct adapter_info *adap_info =3D dev_get_drvdata(dev);
> =20
> -	if (pci_enable_device(pdev) < 0) {
> -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> -		return -EIO;
> -	}
> -
> -	pci_enable_wake(pdev, PCI_D3hot, 0);
> +	device_wakeup_disable(dev);
> =20
>  	for (i =3D 0; i < adap_info->ch_num; i++)
>  		pch_i2c_init(&adap_info->pch_data[i]);
> @@ -908,18 +890,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
> =20
>  	return 0;
>  }
> -#else
> -#define pch_i2c_suspend NULL
> -#define pch_i2c_resume NULL
> -#endif
> +
> +static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume=
);
> =20
>  static struct pci_driver pch_pcidriver =3D {
>  	.name =3D KBUILD_MODNAME,
>  	.id_table =3D pch_pcidev_id,
>  	.probe =3D pch_i2c_probe,
>  	.remove =3D pch_i2c_remove,
> -	.suspend =3D pch_i2c_suspend,
> -	.resume =3D pch_i2c_resume
> +	.driver.pm =3D &pch_i2c_pm_ops,
>  };
> =20
>  module_pci_driver(pch_pcidriver);

--nFBW6CQlri5Qm8JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qeOYACgkQFA3kzBSg
KbYqcw/+IsY4al9ygsQCTnIzbRU6xHkz57+Aqf73p9XdvzNUQVYNYRyLMNmaWni/
dKe5xCjzcZFYbwOzrl6hV2yq1bIR9oNqfaOeoGlETb5cpDclantSXq8IRmn/QbL9
AS9P24aPkpdXRfpBbJPK3h8+T+Pjt4XhUF8KDevF0qvu20UZUK9FX3O1TSEPGg71
pX2zPzEe9e9PZWCfjpBHaE1pkNrFPI7aWPDQYc+Yf+2Uz4P91uxmxnugmcpYlwjg
12Xw6o8wJyfEE1hFdlqOaldHdNYWkIyWqFe91PUOiP45V3Knbz9j/drVpM8MrppX
x359GDAhqlXLAyTnvDdn/I1Gs3dEHKVWPZO+x9k4qDxoFXQRV3vysMCsiDzb26hO
rnEOtiVBghrFL3gJaALHxtEbQ4gSDy1zAKpmolPwUjNaQr3jCv8aOpBMrxy0ZXY9
KE3Mn+xxzpKU7wqEgXuHXDVN18KSZw6W1fNgxthYq1l+H9b7ZOqwgyAYKCE0IaHp
RW2W7FGSgCH3wUXVUkCilhqnpIB4kewXbwgjxtFrYPF7oeAFYkmyEO4HBqGVWw2b
ZvUE7Eg0qeEQjSRs4Bpr+dxhMuNIpYCe3xo1xL+2kInkx1LKSUUtAFyNA5oDEjM8
QoBHfw8YVfkfJIHZrN8k6vuMNnUGZUHYyuMPodwkFhaWNt+SX6c=
=+EIM
-----END PGP SIGNATURE-----

--nFBW6CQlri5Qm8JQ--

--===============4948684065383184789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4948684065383184789==--

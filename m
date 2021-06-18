Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90438C49EA3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 07:17:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC131613BD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 07:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC131613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2CE882D03;
	Fri, 18 Jun 2021 07:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUY7Ug058R85; Fri, 18 Jun 2021 07:17:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5838482C9C;
	Fri, 18 Jun 2021 07:17:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30179C000D;
	Fri, 18 Jun 2021 07:17:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98E1BC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 07:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85DB0414BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 07:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yZQKHLOcEWq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 07:17:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6E8241480
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 07:17:26 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1lu8km-0003gp-5p; Fri, 18 Jun 2021 09:17:24 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a03:f580:87bc:d400:e7d0:b47e:7728:2b24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id A8CA463EA3C;
 Fri, 18 Jun 2021 07:04:52 +0000 (UTC)
Date: Fri, 18 Jun 2021 09:04:52 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] net: can: fix use-after-free in ems_usb_disconnect
Message-ID: <20210618070452.cjt7f5hzlfikztwz@pengutronix.de>
References: <20210617185130.5834-1-paskripkin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210617185130.5834-1-paskripkin@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel-mentees@lists.linuxfoundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, wg@grandegger.com
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
Content-Type: multipart/mixed; boundary="===============8185595315842177813=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============8185595315842177813==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6tq7svrpdp6b2uth"
Content-Disposition: inline


--6tq7svrpdp6b2uth
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17.06.2021 21:51:30, Pavel Skripkin wrote:
> In ems_usb_disconnect() dev pointer, which is
> netdev private data, is used after free_candev() call:
>=20
> 	if (dev) {
> 		unregister_netdev(dev->netdev);
> 		free_candev(dev->netdev);
>=20
> 		unlink_all_urbs(dev);
>=20
> 		usb_free_urb(dev->intr_urb);
>=20
> 		kfree(dev->intr_in_buffer);
> 		kfree(dev->tx_msg_buffer);
> 	}
>=20
> Fix it by simply moving free_candev() at the end of
> the block.
>=20
> Fail log:
>  BUG: KASAN: use-after-free in ems_usb_disconnect
>  Read of size 8 at addr ffff88804e041008 by task kworker/1:2/2895
>=20
>  CPU: 1 PID: 2895 Comm: kworker/1:2 Not tainted 5.13.0-rc5+ #164
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0=
-g155821a-rebuilt.opensuse.4
>  Workqueue: usb_hub_wq hub_event
>  Call Trace:
>      dump_stack (lib/dump_stack.c:122)
>      print_address_description.constprop.0.cold (mm/kasan/report.c:234)
>      kasan_report.cold (mm/kasan/report.c:420 mm/kasan/report.c:436)
>      ems_usb_disconnect (drivers/net/can/usb/ems_usb.c:683 drivers/net/ca=
n/usb/ems_usb.c:1058)
>=20
> Fixes: 702171adeed3 ("ems_usb: Added support for EMS CPC-USB/ARM7 CAN/USB=
 interface")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Applied to linux-can/testing and added stable on Cc.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--6tq7svrpdp6b2uth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmDMRZEACgkQqclaivrt
76mnqgf/aSKQviylfEMXNmblnBD4eGq3CMjiugvH+K4jof1OJ72ztvdUzP2DAfd/
9CA0EE0UWEVpqhcUteGMMgM7F0+AqJF4PvgqiR5YT2qqnWg40xDcC2+NtdRYNBqt
fQt+mzbXNj5J39v8l8FJGPo5Ip7E561khpGG9jA5BFgIT70jegTdNPho+uUV+CKV
1co2LUuDCPtnN/GZHOI3bLflWqr2p1V60RimGZK9QbOLYuf5ZynHkB4+GrwVO+MV
Sryao3eO/JR06Ty6vo4RVh0SqWOFx549SGsl+O9pn7W5U4Sw+5eklu5UVW6OyL52
pWNIVhvfae9qHdITE3ZftnG0OPd1gQ==
=n50B
-----END PGP SIGNATURE-----

--6tq7svrpdp6b2uth--

--===============8185595315842177813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8185595315842177813==--

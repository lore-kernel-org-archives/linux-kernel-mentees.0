Return-Path: <SRS0=Zzie=JT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903ECC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 18:03:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F06BB613AF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 18:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F06BB613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6970583CDA;
	Thu, 22 Apr 2021 18:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id no2jOliiXf_4; Thu, 22 Apr 2021 18:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34FD583CD3;
	Thu, 22 Apr 2021 18:03:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08BDAC000E;
	Thu, 22 Apr 2021 18:03:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14EB1C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 18:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF75860620
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 18:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJd3Uh_y7xwO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 18:03:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55CC06061C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 18:03:26 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id j7so23974609pgi.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 11:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=k0VIW98Anrjot9UIkwH/dJvo32+FqeAF8F46I+kX+Io=;
 b=MytkApmmOFn5AU3TxwS/Obi5niW22MPciW9RlXaXerbbHPUXMMmTaUAzLJgma/w1fp
 IyXNfCr9sOxx+nhZqBIW9kAL6BtXcRXbVHz7y4aFHPZgK81TRCblAXdaMBrWdh9oUzi6
 2KVKv4JWS5dTtDfTIC6muxOcX72GAKK/xPeNc2nExGeu9b1+Nkt8CVepBpJ0/rr60ETi
 I0M7My07X9mFWZPfwcplIx/XqzgIZIFez2tBBUkU65AiPFjCWifmfuQ/RNRJ20XUxOX5
 G1yRvCBoPzo3bKnLV2MzscNeeDjL1+9/rrlLpsETxrqyceF9mEBStH3NzGKb62RT6n3F
 Cgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=k0VIW98Anrjot9UIkwH/dJvo32+FqeAF8F46I+kX+Io=;
 b=SXDGsTSnxgyuodu4BwluFE82Fz6y4MbGUU+XIbdl7qw378s4+PUIC6EJ0GllHuGFQv
 OfRxZcsSVPe0YotCftLf+VQF4Ttg5nP1TxGjzbfwD8k51kkzD2VgC/+pAD3BdqTbTs2Z
 GEJ9JQNON/CEUKzYm24ny6J1gWStHcrZxjssat0j5q9amp6t7ob2OeOFZdb2Xpn7sJcJ
 96PfMsZybwyV50RvB2RWktmDnjdx0/fE2hHHOaGAeXb/8n/fkYM3LeObq8XnA/uu+FwD
 j2rNWmfa5W+BfimRglEIJTwu5Iq5yhfCiV4c4zvD5G39jlW2qjDzQCkM+Y6ljRAI9DJi
 IrNw==
X-Gm-Message-State: AOAM530+2q9tNcDM78sf+9IpdTqpNx5qXWAIjMbk07CAfO6rXr/j51Hc
 s7qo3NOq9vhurCSjzJpGlwA=
X-Google-Smtp-Source: ABdhPJw+sb072t/853L36S0k1UACj69vXg/3sPhkUxrxdMrs9IKOG7ppAzhXceTmAX70EhKUtlh6Aw==
X-Received: by 2002:a65:5808:: with SMTP id g8mr4657870pgr.137.1619114605600; 
 Thu, 22 Apr 2021 11:03:25 -0700 (PDT)
Received: from localhost ([122.172.37.94])
 by smtp.gmail.com with ESMTPSA id 22sm5698913pjl.31.2021.04.22.11.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 11:03:25 -0700 (PDT)
Date: Thu, 22 Apr 2021 23:33:22 +0530
From: Anupama K Patil <anupamakpatil123@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, Adam <developer@arusty.dev>,
 bkkarthik@pesu.pes.edu, gregkh@linuxfoundation.org,
 kernelnewbies@kernelnewbies.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
Message-ID: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0450710620572589009=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============0450710620572589009==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qzysk5dfjuwhgqni"
Content-Disposition: inline


--qzysk5dfjuwhgqni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

de, e are two variables of the type 'struct proc_dir_entry'
which can be removed to save memory. This also fixes a coding style
issue reported by checkpatch where we are suggested to make assignment
outside the if statement.

Signed-off-by: Anupama K Patil <anupamakpatil123@gmail.com>
---
 drivers/pnp/isapnp/proc.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pnp/isapnp/proc.c b/drivers/pnp/isapnp/proc.c
index 785a796430fa..1ae458c02656 100644
--- a/drivers/pnp/isapnp/proc.c
+++ b/drivers/pnp/isapnp/proc.c
@@ -57,21 +57,20 @@ static const struct proc_ops isapnp_proc_bus_proc_ops =
=3D {
 static int isapnp_proc_attach_device(struct pnp_dev *dev)
 {
 	struct pnp_card *bus =3D dev->card;
-	struct proc_dir_entry *de, *e;
 	char name[16];
=20
-	if (!(de =3D bus->procdir)) {
+	if (!bus->procdir) {
 		sprintf(name, "%02x", bus->number);
-		de =3D bus->procdir =3D proc_mkdir(name, isapnp_proc_bus_dir);
-		if (!de)
+		bus->procdir =3D proc_mkdir(name, isapnp_proc_bus_dir);
+		if (!bus->procdir)
 			return -ENOMEM;
 	}
 	sprintf(name, "%02x", dev->number);
-	e =3D dev->procent =3D proc_create_data(name, S_IFREG | S_IRUGO, de,
+	dev->procent =3D proc_create_data(name, S_IFREG | S_IRUGO, bus->procdir,
 					    &isapnp_proc_bus_proc_ops, dev);
-	if (!e)
+	if (!dev->procent)
 		return -ENOMEM;
-	proc_set_size(e, 256);
+	proc_set_size(dev->procent, 256);
 	return 0;
 }
=20
--=20
2.25.1


--qzysk5dfjuwhgqni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEDSQZGCDcREXgcOjQtGmOOZV75b4FAmCBumQACgkQtGmOOZV7
5b77bQwAxwDa39VD4CMPQRKu/YD6PMA4RdJGz+xlci6C5d2/J6CBf+U1Pb3Br+qd
mHciKRDUOxDk36Qi8ChbR98rOyX+KljGd6JdbIJTDlxMdRE6qRn9Ab7oC+bsoYKa
emq8RUJJ8u3NzRkYfoPva6vg0HeNKNGseMyGWa+dFwMql30J9PhGf8ObfN4MSTEL
FHdKlFWF8vZR/pMOSg7/VxhoOCR+H2YtmFxE2h1CKxDzh2RmcU+wLvbuFVTrrD9A
rKdTf/Knfya5mrgNCr+CDDLttTWg5CzXki2rEGO1suBNZB8MChrot/6SEtnqeaMz
dnIuZq5pH91A4/ZSQKYyYNJhtwfcbxO5gagsiwV+Q5BJ0VuDE4L+E6jyvn75HD18
N9Gc3Ey3juPXQbWkK2f8QcJTIXUdlVzhWNDIDorbozgm03Xh/EWK+AoSfxyRxxKQ
DEzGmJgOWfh5BKFUBwSH8GG0WmpoWPfJnyJ0ZPSONLfxZz7hVy5LFhLVg/5fmyXG
GS6WBizO
=Bmv6
-----END PGP SIGNATURE-----

--qzysk5dfjuwhgqni--

--===============0450710620572589009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0450710620572589009==--

Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF05BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 03:42:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599DE20737
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 03:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pesu-pes-edu.20150623.gappssmtp.com header.i=@pesu-pes-edu.20150623.gappssmtp.com header.b="iqDEikdP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 599DE20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pesu.pes.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 08C7420366;
	Fri, 24 Jul 2020 03:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMkAPciq+Vth; Fri, 24 Jul 2020 03:42:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3BD0320360;
	Fri, 24 Jul 2020 03:42:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED2F9C004E;
	Fri, 24 Jul 2020 03:42:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43C14C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 03:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 37CB987FA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 03:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7w7fVamVSR9N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 03:42:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 63E9D87F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 03:42:34 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b9so3738941plx.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 20:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=drptbEG/Dwf7RV6Btnbg2MjR3clmYPNpyibmq/i1mvw=;
 b=iqDEikdPwmUCeN1/trjhTReapycwdilIb/qTGofnT1Hfz4nKgx+h0hQGAgYD/bRLwi
 np7Wckfotsihzq0YYS/pFH094hwHze/9sotHaHzLXuGLdwMYiCLQyB64nt2R1P0zo4BR
 QGT+0RNW2QCNpoooCCO31zGhScm2UMN0QjNDRJsFxMTCnpWeCG7CyhRmmzYAk6/1TzUZ
 YQOyx+QMG7GnY6ELPaZ140lNy1nXT5BwaIsaegoPNgZKI0y0u0+jWfxYtUxpj2h4uzbU
 dNxwGaJQQapbQ7M/d6mAWHwcize9l+nnUlclP7ITvofslUzqZwPGe+G052ZoSp/ZN7Tf
 0lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=drptbEG/Dwf7RV6Btnbg2MjR3clmYPNpyibmq/i1mvw=;
 b=SZcT3HXKTjlU3Zl0C8Wsb/SxWjqai7alygiVDEw8fJPhneJYmAiQnR6bD9L1GPJETF
 kRDdPd//JIgz7GXmZipOVgMG0z7PWclOg7T83hl2meQi5nL2Bsv7vH68xek3kJelFKmi
 l90pc9+MkSztzxmcQZqYQCbALBRtIZiMh80P/momuWKc10Mv2nl1HYviPMIiz3Dx8qkp
 0EcyQG/ckEa35U9gRGmV/H2lM+p4S6kKNs9WKgkP0cH7ws8ZQE2pYVhqAbd+zv2OLKHY
 HaFPV7ebc6xTKeN1IU9PhZrMuCaaxHZWpcUPOOh0FfUEJuHdmMH6a5xhJF9InMhMZY0z
 kJxQ==
X-Gm-Message-State: AOAM530OEFEVkXW905kemQrxfabTluKCEHN7XCjYBJ15xYSGrQM+hsGg
 7ULaUEqqOxhsHiuBsZBZ9gESNg==
X-Google-Smtp-Source: ABdhPJyBunL47URFAxsHRSjWGsc/T2FBIEZUVvQk57WRYeXQJMzDaeL1ZOM8nqayMgukQ2c0s94j9Q==
X-Received: by 2002:a17:90a:d30c:: with SMTP id
 p12mr3587147pju.4.1595562153678; 
 Thu, 23 Jul 2020 20:42:33 -0700 (PDT)
Received: from localhost ([2406:7400:73:d567:d1f0:826d:1814:b78e])
 by smtp.gmail.com with ESMTPSA id 7sm4481052pgh.80.2020.07.23.20.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 20:42:32 -0700 (PDT)
Date: Fri, 24 Jul 2020 09:12:27 +0530
From: B K Karthik <bkkarthik@pesu.pes.edu>
To: gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200724034227.ixvbu5vrdlsvpnwq@pesu.pes.edu>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
Subject: [Linux-kernel-mentees] [REQUEST] for assistance with fixing WARNING
	in pvr2_i2c_core_done
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
Content-Type: multipart/mixed; boundary="===============4524857858828322487=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============4524857858828322487==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="elr6ko6dlxjqsggj"
Content-Disposition: inline


--elr6ko6dlxjqsggj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi,

I've been looking at https://syzkaller.appspot.com/bug?extid=3De74a998ca8f1=
df9cc332 for quite some time now.
I think I will be able to fix it with a little assistance.

I was able to reproduce it, and as er suggestions I tried to unregister the=
 device in the release handler instead of the disconnect handler.
I tried a few things, but they triggered a general protection fault in kern=
fs_find_ns()

Hillf Danton <hdanton@sina.com> said the following.=20

> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggeri=
ng an issue:
> general protection fault in kernfs_find_ns
>
> pvrusb2: Invalid write control endpoint
> pvrusb2: Invalid write control endpoint
> pvrusb2: Invalid write control endpoint
> pvrusb2: Invalid write control endpoint
> general protection fault, probably for non-canonical address 0xdffffc0000=
00000e: 0000 [#1] SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]
> CPU: 0 PID: 78 Comm: pvrusb2-context Not tainted 5.7.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 01/01/2011
> RIP: 0010:kernfs_find_ns+0x31/0x370 fs/kernfs/dir.c:829
> Code: 49 89 d6 41 55 41 54 55 48 89 fd 53 48 83 ec 08 e8 f4 61 af ff 48 8=
d 7d 70 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f=
 85 1e 03 00 00 48 8d bd 98 00 00 00 48 8b 5d 70 48
> RSP: 0018:ffff8881d419f938 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: ffffffff863789c0 RCX: ffffffff85a79ba7
> RDX: 000000000000000e RSI: ffffffff81901d1c RDI: 0000000000000070
> RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff873ed1e7
> R10: fffffbfff0e7da3c R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff863790e0
> FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f3a7e248000 CR3: 00000001d2224000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  kernfs_find_and_get_ns+0x2f/0x60 fs/kernfs/dir.c:906
>  kernfs_find_and_get include/linux/kernfs.h:548 [inline]
>  sysfs_unmerge_group+0x5d/0x160 fs/sysfs/group.c:366
>  dpm_sysfs_remove+0x62/0xb0 drivers/base/power/sysfs.c:790

[3]

>  device_del+0x18b/0xd20 drivers/base/core.c:2834
>  device_unregister+0x22/0xc0 drivers/base/core.c:2889
>  i2c_unregister_device include/linux/err.h:41 [inline]

[2]

>  i2c_client_dev_release+0x39/0x50 drivers/i2c/i2c-core-base.c:465
>  device_release+0x71/0x200 drivers/base/core.c:1559

[1] kobject_del() goes before the release cb in kobject_cleanup() and
kobj is removed from sysfs, see [3] above.

>  kobject_cleanup lib/kobject.c:693 [inline]
>  kobject_release lib/kobject.c:722 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  kobject_put+0x245/0x540 lib/kobject.c:739
>  put_device drivers/base/core.c:2779 [inline]
>  device_unregister+0x34/0xc0 drivers/base/core.c:2890
>  i2c_unregister_device+0x38/0x40 include/linux/err.h:41

Once is enough, see [2] above.

can you give me a suggestion as to how I am supposed to go about fixing thi=
s bug?

thanks,

karthik

--elr6ko6dlxjqsggj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEIF+jd5Z5uS7xKTfpQZdt+T1HgiEFAl8aWKMACgkQQZdt+T1H
giEIRgwAgtFQbhLPZHI3dJocufwEiYNAtVyw6chse7sX70GkjqNgcX4uSkJl5PmC
Vn3KiihGNG4XmIyNnv7EAzquMlR+y3kxM40CHZolAZ4qb4kUjl5kfACgaMFbWVi+
0Cdoo8QEI+FB23iK4KDZ01RTNIquSWFIdiEgMJwcaOhYjunkQMdhcGjQeEFqVS0+
fyozdKY6U1jifTWZoyfCsbs1Mf3van8G1NmT0fdJV3g+tKabsWZFkGiOfMauPsb0
GEtt02Yf6GOcBf/AhlTFLecxVIE6H8q9wP10F9wO9HzVXz1Y7Ftebqms39UtNDYV
PVCLcgOv7aShbRPQbZ4egABRmIxoI3j9J8KwTeSvY9BLiUGNqWJKOatApbPn4vrN
xnEwsP0Ygxkl31kuOirIFLvArnXMGSpOdwCblV0d2yFaM53HMUfXyYgKHrgSNlWg
oGKak0i+JZgDshYmWVUc0bG41yT/JrvNKXRUJzEkct+EUE8CVHHfMloJVKRzLvrD
j1pod0DB
=u5uQ
-----END PGP SIGNATURE-----

--elr6ko6dlxjqsggj--

--===============4524857858828322487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4524857858828322487==--

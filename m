Return-Path: <SRS0=9kH0=FJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AD2C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Dec 2020 11:10:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4243C22D6F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Dec 2020 11:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4243C22D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED56F86F33;
	Sat,  5 Dec 2020 11:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYUIRKD2JqLv; Sat,  5 Dec 2020 11:10:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BCAF86F32;
	Sat,  5 Dec 2020 11:10:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82122C0FA7;
	Sat,  5 Dec 2020 11:10:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B07C5C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 11:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 97F4F86F33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 11:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jK06HO5dCam7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 11:10:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 028E186F32
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 11:10:35 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g185so9247237wmf.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 05 Dec 2020 03:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zEQ8E7ojaFq+kC8IvxQMenlg3y4yfptIxazsSt0Q56k=;
 b=SINnxUyhSoXy/fwd8U60jua0MVrJ+TcG2pDkeB/kvGy9KsyKuc36zLslKFXsC/YGVS
 HRoOjt3QUlRjWypjyGQfZa3jv3XQEDQ15VunFBeyQ5dsMwQjTwLbadhIdfloJP6hhcIt
 cqERVGlKPrigwEdZ4ZKm8+orVQq1lUgCMQ18Pr3juF0ZXM6sPnSi2JBl49JqLr/mZJzg
 2XzH/5quVIuw9uxvHZzJBsODOWttmZ0Y0WRbYNOZnDeH753K4xkwoZkrUoUXh51M0fBf
 92PBnGCD3QkdlkkuSxkF2CdI/MkKoivbqFe+ot+nWM4T5VWGLE+Qa1QA6jTwRXdvVfl1
 NTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zEQ8E7ojaFq+kC8IvxQMenlg3y4yfptIxazsSt0Q56k=;
 b=S5wydodKKjk+6Boo2f3vUu9aAqjx7JBo9hUFgQPpcinpM2fizsZoYBHwsFC+jWgy/Y
 23p4iks2l+Wlx17BzFMlzg6qPAR0EQwEdJnvempkTSaqD83NuM2TG7eihbn24K1uT72P
 Vamc5VIGem9cUfkS14//+d+pPQ9E4g9dre6+tu74DGRVthyI1fUcMVRhRnpF/RLpckgZ
 Kb9LAPLXFWXEioxHhiq2jcqoIHZoG0AGxO5rJn+k1qkSrVAqdnW7AONA9XYGvmmS9XXW
 h3HAYFvnr7w/omnPMAd/d8vLjbwIEd3TNVF39GAmZ/sl30zXDQ4Wrt3O2GGs0Ydjr3dO
 wXTg==
X-Gm-Message-State: AOAM531EtOBtH/lvpb6X5FhwSD7D2bQy2BU7WvEXSxvx+HjM2UZv9Qhq
 q1Of2qHmgqssGZHhTStgxZq6yDv9LbLc7P8aiwc=
X-Google-Smtp-Source: ABdhPJwLkurrSiGS0yPmOjlzqxhNSlzwwCpvm2o79ZqVvwTu6QWFFBjSg2YCJR24z4Il/8MaKH/7iX1XllBd8MuU010=
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr8784535wmj.69.1607166633238; 
 Sat, 05 Dec 2020 03:10:33 -0800 (PST)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 5 Dec 2020 16:40:06 +0530
Message-ID: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: [Linux-kernel-mentees] POC script to apply patches into a
	test-branch and run clang-format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,
In continuation to our previous discussion about ways to make checkpatch
apply patches into a test brach, and probably run clang-format to generate
a diff, I wrote a small script which does the same.

It can be found here:
https://gist.github.com/raydwaipayan/6b8d10470a163f7ae501c703bc27a83f

The script is still in it's infancy and more configuration options and support
for patch series is pending.

Lukas, it would be great to have your review on this.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

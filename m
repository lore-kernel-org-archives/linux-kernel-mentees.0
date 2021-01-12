Return-Path: <SRS0=5uhS=GP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_40,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AF8C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 05:08:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8409B225AC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 05:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8409B225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30C5985258;
	Tue, 12 Jan 2021 05:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lu13wYCvM0Bo; Tue, 12 Jan 2021 05:08:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4C8C85249;
	Tue, 12 Jan 2021 05:08:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B409AC088B;
	Tue, 12 Jan 2021 05:08:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 977CFC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 05:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B07F85258
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 05:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXUisMRPM29b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 05:08:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B386485249
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 05:08:35 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q1so1488791ion.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jan 2021 21:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=+RStQLQXI0S+dzuK6VQPX3X28VmeAjYcBrbR97QcrM0=;
 b=i3Rj8dDVkjgDY3NBXmAV1OxVl0GIL0lWZf5j2JjuCwBObDGlQ50UEz00NzN183xiI4
 bKnqIH37YaOMuWz7eDBIAsI1yZmEjju1z7XyvQNyIKPYJHM46V6i0cl6Wszk5So9rZyA
 lC9Gi9P8bBxk2JudHh7TARsUsWt1AC6j7PXcsAr2ZULGzck/JvBK/HPVf8uKLWL3bzJy
 8wdvwFtzdOtNFNLiJTtWJSHGaWr9aZz3SwgsVpk5yfPlhaOBpuyw68NNYlc1t8iYtbNJ
 m6O+Q0aU+JE2ZsFrUVen7bxFGuDP2D4NW2i6pCVobfyECFde7V7nWhDeDEl/3vpV3/uL
 D3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=+RStQLQXI0S+dzuK6VQPX3X28VmeAjYcBrbR97QcrM0=;
 b=Eyv7q71gnV1lisQ1L6Cv6Ozw7WkWaDZBuJFd2Rpobw7TiagYfdsBnJKnGsiHC26+0Y
 xnmYTbhiAPyc0EfHeFQNzsAXExD7pmlchIehO0WSbIFuzeifATgHeyOVH5GDMonQjTwg
 fliaGrdFbesKc2ueifJgG7oSiHD8VZmhV84XVSuFMZVboIQwpWrs//hjpysr8ahKtoVo
 gh9ZvZbVSpQe0jyPEoPSYZ78aucXFNXTMkNxlCCkQTz60rfNy64VgIldxFGUBrhN3ZtU
 Axtuvtas7lts1YIZDkw988w5lf+O4QA0SngLUvQvR8BbRBBlIN3j4uwIVQstXWnpvPJN
 gUow==
X-Gm-Message-State: AOAM5316ZFIqkybgi+FPmc1F2jpxLrHOukviiLB/alruhYR/jjf90y0E
 TobK0/fq6QI/v4/LenhCjaMl1xbMBCdwfEk/gxI=
X-Google-Smtp-Source: ABdhPJziXZ1GXYge2V+SPHZpTGTm7Ux3VgXMBUOfV144qpnsOwwupP11E/QeCFr2zhjesRGVrr2H72deuASNiw/OwbU=
X-Received: by 2002:a92:d592:: with SMTP id a18mr2345418iln.64.1610428114923; 
 Mon, 11 Jan 2021 21:08:34 -0800 (PST)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 12 Jan 2021 06:08:24 +0100
Message-ID: <CAKXUXMzydtFqJ_ZRoF0HQugTBYHZZ56ws9AdUq6TmGL-m5JP3Q@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] comment on checkpatch
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

https://lore.kernel.org/linux-next/20210111230029.GM4728@sirena.org.uk/T/#m355576186555c4b6e85dbb9a1b3fe3d5e80f6e9f

Aditya, Dwaipayan, Have a look. checkpatch already handles this, right?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

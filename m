Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DD1C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 12:52:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43D321527
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 12:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t3rQYLxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43D321527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 54AF787B98;
	Wed, 14 Oct 2020 12:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fi5lntXG4rpX; Wed, 14 Oct 2020 12:52:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F32B4876D5;
	Wed, 14 Oct 2020 12:52:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3FAAC0052;
	Wed, 14 Oct 2020 12:52:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99C07C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 12:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8311B87B98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 12:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obgy-4tjSR-P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 12:51:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 150B6876D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 12:51:59 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id b1so3519663lfp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CrQiNLdocfTcTLAd9j40vDriU+zr9Xo9LkOFCavXT08=;
 b=t3rQYLxVN9iNmDwj6qTVJ5Md8W5QcW8M1yRg3zisJi4sYe4OIFPWTglm+YivOhH0SN
 q4vTqKBIKtWN0WLVFvZTbaDUpmrSWdyEiBSQ7h/EIyKxzSJAvqe9fIPSBKL6P9kHDVR4
 YECBezPlIQ64OkzyQNZ3OgtcbU2dBkzKCGAdprttHU8sZAXkyXG6HB8v8vD2uQpEwVpp
 0n7PUxPw0c5x7yxgFPGe1/T6cLOEHEvOC1umsELZTp2hLarynXak/DLlHG2XswOKZfbs
 1pnW1uRZeJ0Q4Jt1wxqLnQ9B//qpCXvVvyF4jEEfnN6dlShIbQO2JU9cPaUU2W5ZE9QZ
 xnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrQiNLdocfTcTLAd9j40vDriU+zr9Xo9LkOFCavXT08=;
 b=Ov4tK1EfEcnMxDfyZW0o7Hg9g9qWEJVO+f+hDUbFIDT5yKiqwEc7R4BgoHuxvH9JFw
 SS8pxUjtHYDXMxJSMJ1DgF1dnkMvyAKUmwE1UT7iDpImw5l2mstP+j2c807IKCLxlZWd
 x7duFpNkj4IFP/cTbYvgH+8iVkKkGM/oLA7Fl3ISjHH2dEKWn5h62hGykD2+MmdwDbTE
 MItdZX+lFGm+PG7/TGe89u1FOSwnTbRrk7xWmQQS9bn8QNFDqR8uXS3TdptzCwsA4ugJ
 WJwcpkoDHfgFL63vqALCrU/Jy0EJMVxJZMeR4I1g4PhD9+7Ju6myrRJHy9uOUMMnTBLm
 dD0A==
X-Gm-Message-State: AOAM530nczCLk/WAKDiDhLac10o0daSu0iZxWN3WU74BQ3OkY0kTIu+D
 JMaJ69LWfnk7G5RUknIbuZTZ9g4HFDC9414r308=
X-Google-Smtp-Source: ABdhPJyf8M4DdPvHx1pcTfenVs+tR5M2jNsagfYcwA6MGlXalv0Gnq7VmkuOIkbR7ijokD3SzibRXYRQ2LsNXA+BDFc=
X-Received: by 2002:a05:6512:52f:: with SMTP id
 o15mr1211675lfc.381.1602679917293; 
 Wed, 14 Oct 2020 05:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002954fa05b02468d7@google.com>
 <300c32a1-a0de-4f05-b467-0822b3d21733n@googlegroups.com>
 <CACT4Y+bw2EXyKnO6mB3ZKBTWWJ1gd7VMkNvYxD=xwbuRjYwj8g@mail.gmail.com>
 <CAC2o3DKaaxoManhVoFVeB8bLQycPVY8z+ndAVqVaT76vvgzm=Q@mail.gmail.com>
 <CACT4Y+ZBPTwvf9gH8JerBQLNCBvRPvXQpvGvDSHD2Y8Tsc91gw@mail.gmail.com>
 <CAC2o3DJus556g6DOtecZB2a8cGJEtF-WrkvrYVj18EPfYHnK3g@mail.gmail.com>
 <20201014095306.GA3597742@kroah.com>
In-Reply-To: <20201014095306.GA3597742@kroah.com>
From: Fox Chen <foxhlchen@gmail.com>
Date: Wed, 14 Oct 2020 20:51:46 +0800
Message-ID: <CAC2o3DJX3v+TqtQH=JL=WZ3e_O35nR9Yt5KiLwE0-Fc_5UeAFQ@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Dmitry Vyukov <dvyukov@google.com>, 
 Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] KASAN: slab-out-of-bounds Read in
	squashfs_get_id
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

Hi Anant, Dmitry, Greg,

Wow, mbox & raw work. lore has mailto link, just on-click, even more convenient.

And, yes, I've found the mail on linux-kernel list.


Thank you all for the help! :)


Cheers!
fox
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

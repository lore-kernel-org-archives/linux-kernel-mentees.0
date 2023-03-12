Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981B1C6FD1F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Mar 2023 10:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3856415BB;
	Sun, 12 Mar 2023 10:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3856415BB
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K++Sac4Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uy8H1r_LoA7n; Sun, 12 Mar 2023 10:38:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C95CE415A4;
	Sun, 12 Mar 2023 10:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C95CE415A4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 303DFC0071;
	Sun, 12 Mar 2023 10:38:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0A95C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Mar 2023 10:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88B244013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Mar 2023 10:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B244013B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K++Sac4Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDehNqWZFMQq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Mar 2023 10:38:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81AFA4010F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81AFA4010F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Mar 2023 10:38:35 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k25-20020a7bc419000000b003ed23114fa7so301955wmi.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Mar 2023 03:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678617513;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnXUvgY/lQbEIAhlEWITjQxBBwr5ulB+Ngn573yt/HI=;
 b=K++Sac4QXPb78WLLWM02GJThSsUv3qZfeOODf7zH2AwS8i+TW91re2iyfOp4znFqDY
 TMEl/CMOR7T2VBIorTE3Xek4DUJTXGc7BjiRMhyjzDYJGtR7WiAFr9KeZQAhqKvzw0+O
 XR7t72kD2BUjBfkXY+23K89GdgTeejTKGFXZ53eY1CHCq9smOQ5p/GnuvrQWqtdkB0U3
 XfOrilDJxT25DU71vQAGXZLOpr3TI1J9WWz+840jqH2M1k9QHf5jddOexbBqPyScmBK4
 msOJUElVhOnaM1UNc6NKJX6etPi5h6KOTUfap7ygMt/Xrk88z4nYWjrrhAiO3d1Drs9H
 X8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678617513;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CnXUvgY/lQbEIAhlEWITjQxBBwr5ulB+Ngn573yt/HI=;
 b=ssjjHdofbdcKKn0Eq88xqcDWpfbM3YLLbV6IO4hiJ4RYxXjxljKgI6cly8mBmHvYxr
 v6p+rdhpCuqmlJyMl0Fj4J5a/aFH/uJfICHECCXerBpuMweTLIZeJkO5d06k6QE6LSZf
 c2Bi5ATbL5aajXTSsvnKmfE0iIPux3PohcomCJovpRPh5lRZHDujQubjUO2jz+uiOFqc
 Ql/CSiL9wcPbdXdgloFbcPcuGobiOEFH5yl5bRntaBzsGOlINOm6gqug5EWuNebik4So
 xffJzFDqRw3Cit8OKzd8DuDswuknPk08BXwNoeVawu/30QPF5JUOph7/Wg7QT86c/qkF
 Vqqw==
X-Gm-Message-State: AO0yUKWdqxTHDrq0dQAT50+9b52uqSuxgzQXD1sT9PC6MZ6JG7f7pXMr
 +KOWQewKw4O9KqxUJIenJI8=
X-Google-Smtp-Source: AK7set8k890tWSm3x1zwHHcZ1fsnkgG8rK7caIZ4MvxJ1EDFfxtQOcnNYywc1mPxSE+XJ778iw+qJg==
X-Received: by 2002:a05:600c:314c:b0:3eb:2f06:c989 with SMTP id
 h12-20020a05600c314c00b003eb2f06c989mr7758660wmo.22.1678617513487; 
 Sun, 12 Mar 2023 03:38:33 -0700 (PDT)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a7bcc12000000b003dc47d458cdsm5650478wmh.15.2023.03.12.03.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Mar 2023 03:38:33 -0700 (PDT)
Mime-Version: 1.0
Date: Sun, 12 Mar 2023 11:38:31 +0100
Message-Id: <CR4C8V5T7751.HT9WYT9LB7X1@vincent-arch>
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Ivan Orlov" <ivan.orlov0322@gmail.com>, "David Kahurani"
 <k.kahurani@gmail.com>
Subject: Re: [PATCH] 9P FS: Fix wild-memory-access write in v9fs_get_acl
X-Mailer: aerc 0.14.0
References: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
 <CAAZOf24yhpSBd1926v7T=qDwqvFfLsWMJeMKTafeZ=69hJ4rdw@mail.gmail.com>
 <d5bb5ff0-1102-c7cd-c21b-c3a7f4f31717@gmail.com>
In-Reply-To: <d5bb5ff0-1102-c7cd-c21b-c3a7f4f31717@gmail.com>
Cc: lucho@ionkov.net, ericvh@gmail.com, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, linux-kernel@vger.kernel.org,
 syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com,
 v9fs-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat Mar 11, 2023 at 6:35 PM CET, Ivan Orlov wrote:
>
> > I'm not sure what are the rules around here but I prefer to use brackets 
> > more generously.
>
> I think in this particular case they can just make the code less 
> readable (considering they will not change the behavior in any way). 
> However, this is eternal discussion and I saw examples of both in the 
> kernel sources.
Maybe this can be a good reading [1], I think it is more a kernel rule?

[1] https://www.kernel.org/doc/html/latest/process/coding-style.html

Cheers

Vincent.

> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

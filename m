Return-Path: <SRS0=Icdq=CT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66DEC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 06:04:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B4A20756
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 06:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6RIBZs6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25B4A20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9548875D7;
	Thu, 10 Sep 2020 06:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxOs0cRYBN2H; Thu, 10 Sep 2020 06:04:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 592B087574;
	Thu, 10 Sep 2020 06:04:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50B64C0859;
	Thu, 10 Sep 2020 06:04:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82970C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C1FC875D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2rSMEwRSKFx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:04:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 17F7587574
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:04:13 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id z22so6925507ejl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 23:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Nlzq5JCrdcazIHIGBfCFR/q6rLOGrb56BuSeIs6lLKw=;
 b=b6RIBZs6M72wzqE7mqjwv4tznp5hRzixRlVsW07tbEg9hye5vs5HTj/V7mZB1TaMj3
 KBirFsqewebj9ewl0wQkOBJF5ibssFXtOiLhtp1p+hS33XbCsshd507hT2W21kg0BCJz
 GbEDnFMWZkm5SG1emC645abdktnXimUhCpWcEYSIhnf5J4EKvy8gbzm2IhZ5mZfHCamw
 wSdRkYu5f2qDRklYQoyiDN2pPOrG2Sak3tJe1q2W+Va0OmK+kOUBRrbYDjaG29JKv2+H
 AGLjfl2BSs/NFHpX7zIHIlHzinudbZwfBgR3u8ObdLsXeic6CY5dcosdzr/pXeg/j963
 RPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Nlzq5JCrdcazIHIGBfCFR/q6rLOGrb56BuSeIs6lLKw=;
 b=rgRGuLG7WAPuM7j6/Z5U+8MiGiGUVEYFiCecTwYnadgm69NvMm46KMn9+jkwh73lJh
 nPt8flYJPe7a6jgcXizZhnMm+Dj2aZw7QrUf4LiaW/dcQeTQAqApOy78owixPsHwD9h6
 JOl80CWvkrel6noXd6HhZIViALHcTXT07J6YTOo1jIblWJ3bzUulKs+Z1scDDhIjQ4Gh
 fD2HI4FSZFbFqAcrVhqn4T47QmK+kF3cy6eaoP/pwk3ixIwoegiz5JWiTBHGLx72On9w
 LJJFJZy+Unw86tun2QLl+r1kLLINf9EDT75UKKl1cGqqS7HT+8NXevahLtyzUG8kRGMA
 WBEg==
X-Gm-Message-State: AOAM530UVU3X23oD49GvBaXe1N5feX1R/YXu6ugWXAwTBPS28Lv1sQa4
 SRLtk+UaO0EDJ9yVN8pUxu0=
X-Google-Smtp-Source: ABdhPJwe3XnzSvEyj5rSwd1opjry3eIj2PgQ7dOPNp3O3D+j5DY/XG6TjFDdUH+bsjMCDXawGzee/A==
X-Received: by 2002:a17:906:2786:: with SMTP id
 j6mr7014242ejc.73.1599717851455; 
 Wed, 09 Sep 2020 23:04:11 -0700 (PDT)
Received: from felia ([2001:16b8:2d2b:3f00:adbe:f1da:86fc:8df])
 by smtp.gmail.com with ESMTPSA id y25sm5482919edv.15.2020.09.09.23.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 23:04:10 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 10 Sep 2020 08:04:04 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <7edaf9ca48af99a1f288111320e263b5@disroot.org>
Message-ID: <alpine.DEB.2.21.2009100759130.5893@felia>
References: <alpine.DEB.2.21.2009091145130.5622@felia>
 <CAKXUXMxBxyQ9KM1d92d0vGuaGRLe6+aVHa3s_O=E-YTq_jLPJA@mail.gmail.com>
 <alpine.DEB.2.21.2008270707440.9436@felia>
 <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
 <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
 <alpine.DEB.2.21.2008310702520.8556@felia>
 <a6f436fe39f48d9b7e537bdfad07fc7e@disroot.org>
 <CAKXUXMz8MphA5PYtLe_mB+3qNV-PSimmSVS2+P5vpv=4+VsBFw@mail.gmail.com>
 <8802360392ba3dd9ded3999c3f57560b@disroot.org>
 <65d03f2a884a92f5094dc417d0bf47e0@disroot.org>
 <7edaf9ca48af99a1f288111320e263b5@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Regarding "Linux Kernel: Evaluate and
	Improve checkpatch.pl"
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



On Wed, 9 Sep 2020, Ayush wrote:

> September 9, 2020 3:22 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
>  
> > Create a separate patch that can be applied independently. As a mentor, I
> > suggest to first send the patch only to me and the linux-kernel-mentees
> > list, so that you get some first feedback without bothering the
> > maintainers and them losing patience to work with you.
> 
> 
> I created a patch which handles line break between commit and hash value,
> 
> It can be found here:
> 
> https://gist.github.com/eldraco19/1631a75f859a07541d3c7c73c4958ca1
> 
> Please review it and suggest any improvements.
>

Ayush, that is NOT how the review process in the kernel community works.

The process is You send a patch to a mailing list for review, reviewers 
review and send back emails with comments. Then, you rework and send out a 
new patch and it repeats. That is the process.

For mentees, we have the linux-kernel-mentees mailing list, so that you 
can send patches to reviewers that are willing to provide dedicated 
feedback to mentees.


Lukas


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DBCC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 07:43:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E35B321924
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 07:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJkoXSg1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E35B321924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8DD6B867B5;
	Wed, 23 Sep 2020 07:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nspa7uiHv+2h; Wed, 23 Sep 2020 07:43:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C75E83138;
	Wed, 23 Sep 2020 07:43:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03977C0889;
	Wed, 23 Sep 2020 07:43:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54BEFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 32FCD84F8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBBYkZq27A7Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:42:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4B4C384F48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:42:57 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id e23so26405139eja.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=p+AKlmI4mkI8W4L1Ys1UPpYD51ApBoydpXIO/kpMta4=;
 b=sJkoXSg1a6b3Dr38g+bD5rP+ZDxZikXZ0qEnPta3YXA+ZpeRKKAIGiwwrhrxTlbJRr
 84jOS+Oi4M9RD9KKltS5kYGrpNL1NRE3fB+l7nw81hNl2TmYY7i74mbCZH+0zXIfxbCR
 DlpC9yq9sb6umekrmw3crLp2VMpDgS0cDcy5S5xG5t/3ViIWCmjQirnXvYHMxPhyscyP
 AhycnjYM7DLroBJiTOOfC1Dm2CX2putnWNODML2Ylr22AByDLcSv0hsu4hm91zE5mlix
 ElnHx3CFsUcuKpy7ZuakqIlHebNgZ3hnFG8kHoiA9idDRDLPeBu1Omhw5glhZnMKSrmt
 yuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=p+AKlmI4mkI8W4L1Ys1UPpYD51ApBoydpXIO/kpMta4=;
 b=XSiIeCo2dAS0sGaA1RBiLr2tb2aJs1jj+i+ItdxunXl1rywiscmi1B5FneEiJ2VSRb
 QJ1RjQA7YzGk6UM6VwhElk83pOmyLUYwl35Gptvy5fP4qRgAAK0FIlsz2WF+qACNc/qb
 f+lxz+ippJ9PO8WBSFnS+pGkTMJpJzCmK4Etsor9tacJF9epibHEkVZm/vKW4zjnONLA
 jPFWVATY6j2BCcLi0lltyd2QhlLmPhWLI0dyjClfcPBi5+GgcrnFriC+FrVDMj9v0XeK
 tqKKk6zfJv5D4eyv4EWMWiaM1sK9aN6KAVCOJBqdwtM0I0IJ+a3ulLT3YS00fAmIOSFr
 ItKg==
X-Gm-Message-State: AOAM533GNU91a/AhADlrwafBYMvrVVNmt3W9TdH9HzEDzRxviREtdc4p
 h/PtYKzOTah3Hx1ZAS5oQ/U=
X-Google-Smtp-Source: ABdhPJw9xE7OvxpK9SCgTshjO+qjx5YV6UouoAxH9NQ/qxHnXeC8odNxlry+Dh9dNz/9+Z/VceIYZQ==
X-Received: by 2002:a17:907:70cb:: with SMTP id
 yk11mr8762556ejb.312.1600846975560; 
 Wed, 23 Sep 2020 00:42:55 -0700 (PDT)
Received: from felia ([2001:16b8:2dcd:aa00:cae:324b:3a69:3822])
 by smtp.gmail.com with ESMTPSA id y14sm13176287eje.10.2020.09.23.00.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 00:42:54 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 23 Sep 2020 09:42:53 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009230941250.6068@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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


> 
> > Regarding the mentorship, would you have time for some virtual
> > face-to-face meeting to discuss the Eligibility Criteria and Mentorship
> > Models?
> >
> >
> > Lukas
> 
> Yes sure, what time are you available? I don't have any more classes
> today so I am free.
>

How about now? Let us quickly meet here:

https://meet.jit.si/Checkpatch.pl-Mentorship

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

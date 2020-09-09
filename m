Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8269FC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 14:13:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBBE221F0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 14:13:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1JO42Bn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBBE221F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 698D785A78;
	Wed,  9 Sep 2020 14:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gavzQqtzshP2; Wed,  9 Sep 2020 14:13:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 61D9885D6E;
	Wed,  9 Sep 2020 14:13:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5830FC0890;
	Wed,  9 Sep 2020 14:13:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED9A0C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 14:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DD40A8763E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 14:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wCtppWlUZpm3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 14:13:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0A2D88757C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 14:13:25 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id t16so2798021edw.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ufUHDeL5cKZ/+xLpUtegneGgCqEIIJ9MSiIZ40klJmw=;
 b=j1JO42BneAiWj6yjowIJNAzc289/S4C/AIarzVPc9O0ro/zJIjHI8zjruAnUZcwHyI
 HGH+oNDKD85MluRhbKGgMK+QWxNl8jLSftRbty0J2UO2irO6vvWMzGXGg7nHn/KFZko/
 wytDqlSv9W0NroxFeMlJfPsOUkHnfbeCV3undeEvyafKQRhEcG5tnScwqR8fc+alPgto
 t+AWElZoCvzz++h1mToeJ9FX5RnBtwd7RqQj4RGd4hD5KqdD/G2X2o/3CFP06yKmzQFX
 /C+M4lnJLqkC8+F43TxgyWJuxEFp6N+4dzefIlZiWwO2XMRSUNY26tHMQKsC+qV5KZYT
 RZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ufUHDeL5cKZ/+xLpUtegneGgCqEIIJ9MSiIZ40klJmw=;
 b=jPrPj9rqPxv3NLPX2udnzLQAuRLJU57Mc6eLh0jraw7hEAHmJCpkCfWamxEss/YZiG
 vQivu0PaGw4IMFGpOHpoJkDXjZg0ZUEQo1+yBtHHo9Lh0FKcghsYePDwPDcMohBcntwD
 pANUtBdmnJHvm/JmCukBjeabVe23Zxc8eAprDyrTaV4XGozy7bPglvceKQ1Q84+slfMz
 XMrPcKXpkjFVRXddjWvdqL1USiv6zd64SBgKYGWkoMFdNZ3xSoTbbQ6lIpAmA5hMqlQy
 +KxCFfMgRpioSAAd/E2KdtPs1JXKTAfVVWroTKPK9yIUPzLOAy4WZmIAoyRqeNChZWkx
 S/Gw==
X-Gm-Message-State: AOAM530cRajyLbItmUeelrLFHLpOhyBMdy1J6P2Xzxqd2OuZUm+SkL9C
 oT1KWARPirrKZTNpcBKoDfM=
X-Google-Smtp-Source: ABdhPJwOkAKqerI0PvjqiN4tkHsWWVzpYVi4cKWDeRMrV7y16dFhu0O0lWJp2alIdKkoCv3wdFiMQA==
X-Received: by 2002:a05:6402:ca7:: with SMTP id
 cn7mr4190839edb.143.1599660803538; 
 Wed, 09 Sep 2020 07:13:23 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
 by smtp.gmail.com with ESMTPSA id w8sm2525792ejo.117.2020.09.09.07.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 07:13:23 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 9 Sep 2020 16:13:21 +0200 (CEST)
X-X-Sender: lukas@felia
To: Alaa Emad <alaaemadhossney.ae@gmail.com>
In-Reply-To: <CAM1DhOjACW=BGQvOvfbQZGexYdwa0wf-CCNHQ=XvXdWkUC3XpA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009091611130.23843@felia>
References: <CAM1DhOivT_U=N6K-J0A7aDpG9QwEng4n9nZyS5knDKofqeunuA@mail.gmail.com>
 <alpine.DEB.2.21.2009091511200.23843@felia>
 <CAM1DhOjACW=BGQvOvfbQZGexYdwa0wf-CCNHQ=XvXdWkUC3XpA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-725405304-1599660803=:23843"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux Kernel: Evaluate and Improve
	checkpatch.pl
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-725405304-1599660803=:23843
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 9 Sep 2020, Alaa Emad wrote:

> 
> 
> On Wed, Sep 9, 2020, 3:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> 
> 
>       On Wed, 9 Sep 2020, Alaa Emad wrote:
> 
>       > Hello Lukas Bulwahn,
>       > i hope this email finds you well , i applied for  Linux Kernel: Evaluate and Improve checkpatch.pl
>       >
>       > according to the first two tasks, i am unemployed how should i respond to these?
>       >
> 
>       I do not know which list of tasks you are referring to. So, I cannot
>       comment on the first two tasks.
> 
>    
>    1.Participation permission from school or employer.
>     2.School Enrollment Verification.
>

Please check the CommunityBridge organisation if mentorships on the Linux 
kernel are also open to mentees that are not enrolled in the university?

I do not know the exact expectations for the mentorship selection.

Lukas
--8323329-725405304-1599660803=:23843
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-725405304-1599660803=:23843--

Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E43EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 02:12:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631BE20792
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 02:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="atGnOu7x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631BE20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2D56788494;
	Wed, 22 Jul 2020 02:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XspQM+VeR-Mp; Wed, 22 Jul 2020 02:12:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB85F87DAF;
	Wed, 22 Jul 2020 02:12:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A138FC088E;
	Wed, 22 Jul 2020 02:12:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18956C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 02:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1551A85427
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 02:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BS4eTFeI_vIb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 02:12:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9E673853C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 02:12:41 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j20so378531pfe.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9rx2ICY1n/mQSkvQxm3DqiqKMym6DrzmjM7s6SFLwEo=;
 b=atGnOu7xHD1d7gov5LcXUyObLmqvtY+NKSNPa6d6jiajFGLijXYs76qCGG2MyxBXpt
 B4bCLJke54FioXB7TsLyXbctIuODAyg16qUDhNP9VyX7cVOdVgazx2VRtEkJCvESrShA
 D5FCyYUeM4oFS5jlVeUgWWTs6v7LIjj7XbbAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9rx2ICY1n/mQSkvQxm3DqiqKMym6DrzmjM7s6SFLwEo=;
 b=cnOB2TnjazB2QyFMu4EsyksjI5UoxMNOkzJlUUSE3gZ8pYi+o6ahhu2zB4dXG0dW1B
 fJJum8xBN2iSV4t1C2WHlpPBVk0E0H5KZOl1ZojuchlAV+pBe69Mc0/kUoE0TnTWRpgL
 55dQtU5n8EJpm9rJ/UbHJh+tDcM3bhGMPWBJ+xkBcT8D+fLTVKRMI6+4/oAfUvlJ5NxS
 zn5drhSz1HdvaLu8Fixo5Fl4xJ6ksrPhl8785zYUdVbEd7XZWXKCeOwmYzzygCwm2V8Z
 sh6wIBJhP9GO64Tj//qvZ8Hdzy/ySpGPxyk4YyYsIhjDp4XbDQzZ4OxyiRWL2LwPFhSM
 iCrg==
X-Gm-Message-State: AOAM533R0hURCpwZQiXM+OXjPq8nLa7jZGc7fn49bydw172jOP+yKUq1
 0ssWbZbhhzxhRHgo7kcrprntrA==
X-Google-Smtp-Source: ABdhPJxqnoNNPu7Gh1zJCb1n8eFvBd5/4XYBGHD0TD6QA8KDFgS1fU3XMMQqJud4CqpFOVMOBEqe9Q==
X-Received: by 2002:a62:cd89:: with SMTP id
 o131mr26386979pfg.195.1595383961041; 
 Tue, 21 Jul 2020 19:12:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i67sm22574975pfg.13.2020.07.21.19.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:12:40 -0700 (PDT)
Date: Tue, 21 Jul 2020 19:12:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <202007211911.666E080@keescook>
References: <20200721174654.72132-1-vitor@massaru.org>
 <202007211207.5BAA9D8D@keescook>
 <CADQ6JjU8rX2F_iBqth3u0EiA+CBgz4H+YL_-nbQ_cojYeLFXKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADQ6JjU8rX2F_iBqth3u0EiA+CBgz4H+YL_-nbQ_cojYeLFXKQ@mail.gmail.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_user_copy
	to KUnit test
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

On Tue, Jul 21, 2020 at 07:19:12PM -0300, Vitor Massaru Iha wrote:
> When you talk about end-of-test summary, is it what is written in
> dmesg and not the kunit-tool?

Right, if I build this as a module and do "modprobe user_copy_kunit",
what will show up in dmesg?

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

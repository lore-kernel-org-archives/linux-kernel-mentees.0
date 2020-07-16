Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14A2C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 16:32:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA3020739
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 16:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="coWa0ly+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA3020739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E98C8AEEE;
	Thu, 16 Jul 2020 16:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqF-WN7wQBZs; Thu, 16 Jul 2020 16:32:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 49CC88AE0B;
	Thu, 16 Jul 2020 16:32:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25A16C07FF;
	Thu, 16 Jul 2020 16:32:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFF62C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B034F894A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jg7IPKne6Qmt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:32:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 10B5389481
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:32:06 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id ed14so2988323qvb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=IqaV5FL0PECxrzqMcMpsU9VUXbw3Oykiac0eOEM8xRk=;
 b=coWa0ly+THdkxmgAczU5j9YW2aZldQ+LrSFhlaBEd4BmZx6OP9QCpUiKKmkMvikvTv
 IwNqFmD13zSYGJ3Zh7enFVghVnftWaN+vSKRmGVHLgBNDWC/5gRlvJEcLujqB7jjJPez
 J8r97Xsji3+8GEr8De5QUMMLxi6z8XIa1O5rbljptJtjo4bSVC8BThwDxIZqVJ+CwCNz
 LxKJBFDtUsvXAahhlyCvHcl29Jj6xMg2otzTkGUaRf2+a8KBB1kjm/cfokdzDoRlgHOh
 QnZ/Y4+Q7jYPfBVVRjfJshnYWt+DVDWaHsZSbgfktyYMoAE0KKfvyXxXj81fg+t5dTeZ
 X3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=IqaV5FL0PECxrzqMcMpsU9VUXbw3Oykiac0eOEM8xRk=;
 b=jEoInuxipR7Z7RjlydWBJfUkbeOKhAsR4V6xEgOVSb1M/WkWNohPI1dyownp5c9sP2
 9BPwyKzWX7kV8ItPvL8/lmBzkt3JZDPkgGxDdWMKygvqaAtmDAtYYYYrm0fNw/JArO8o
 w/UFKRCYqknp8xoAJGSE4y0YIFrnWH84xV9aW7Iq1c87JrRL4Fm1iNevD9Gqjh2vunFC
 UMnN69PahdiqWkcONCafcOKzF2o/YfiM6vD9OCGY/sx634h52nXUJSkAmsJO5GQkS+Sc
 jK8aG7TRDk1emXz1L+LnjLZ8EieZu0ozXISsuRcqOO+e6kFbc4ZKTUpVy8sdp9Za9uaI
 7x2Q==
X-Gm-Message-State: AOAM532pCs3p67Oj/T8StyjtajaMAP8cCfpwlpjbs7JKGoFTQOI4bHDk
 WWiCrlKxxU24keSddW3MA1g2HQ==
X-Google-Smtp-Source: ABdhPJy97JfulwTIX38u7Qbd97AVcE4dFHFkx2zvVbbPhDUKKWpZv/FUnRVMqlX0T+/IfOSfVGDcuQ==
X-Received: by 2002:a05:6214:8f4:: with SMTP id
 dr20mr4872867qvb.228.1594917124969; 
 Thu, 16 Jul 2020 09:32:04 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id f15sm7083485qka.120.2020.07.16.09.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 09:32:04 -0700 (PDT)
Message-ID: <196eed159aa0e4c94f7481b148a458a465050dc7.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Kees Cook <keescook@chromium.org>, David Gow <davidgow@google.com>
Date: Thu, 16 Jul 2020 13:32:01 -0300
In-Reply-To: <202007151939.62EFE6F@keescook>
References: <20200715031120.1002016-1-vitor@massaru.org>
 <CABVgOSkBAiMSMzCx62_CRo_0e2SGdvRWZ0dSC4t628YJBw-3Aw@mail.gmail.com>
 <202007151939.62EFE6F@keescook>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL
 SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RFC 0/3] kunit: add support to use
	modules
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

On Wed, 2020-07-15 at 19:41 -0700, Kees Cook wrote:
> On Wed, Jul 15, 2020 at 11:47:11AM +0800, David Gow wrote:
> > - The inheriting of the mm stuff still means that
> > copy_{from,to}_user() will only work if loaded as a module. This
> > really needs to be documented. (Ideally, we'd find a way of having
> > this work even for built-in tests, but I don't have any real ideas
> > as
> > to how that could be done).
> 
> I'd like to better understand this ... are there conditions where
> vm_mmap() doesn't work? I thought this would either use current()
> (e.g.
> how LKDTM uses it when getting triggered from debugfs), or use
> init_mm.
> 
> I'd really like to see the mm patch more well described/justified.
> 

Sure, I'll describe the patch better.

Thanks for the review.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=93Ws=7X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4110CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Jun 2020 23:31:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B682078D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Jun 2020 23:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7NRwO63"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B682078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 812528770C;
	Wed, 10 Jun 2020 23:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Cz_4Ndbx8ye; Wed, 10 Jun 2020 23:31:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3F6187700;
	Wed, 10 Jun 2020 23:31:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A675BC088C;
	Wed, 10 Jun 2020 23:31:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E3A6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jun 2020 23:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7535D84F96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jun 2020 23:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TXHIvOw1aYKU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jun 2020 23:31:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F36DD84371
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jun 2020 23:31:13 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id i12so1466201pju.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jun 2020 16:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UT9FnFM5xebfMVQH8K7LhtU4hS4AAveJ9mOb4TNd+NE=;
 b=h7NRwO63hHsUCZQJZkYumA6LYRgIRn0IoRL6iBh2ApZV9uMz6ZScMllD+vxV8uCBNP
 tstmXoU/McL4/qy18rfATaye/a2j0pf59kJClauqRBHe14PLQ4jcPYOKhUZOcUFr6Mwr
 64ao8Q1ZXDAphKc8pa1/alM81mHqyRnQ3YAX+XN5c9GG2hwjsVMOdQbax6B+tucVYcEw
 ZM+RA0ENBxQfbKKPXou8yNVzuGQ0sY+9gK7fiI+GsCoxFqrwAtzT2wCfqyDumKU7pUuT
 /QaYb5g1MDj1XW5bE8j4WvlYPJhxpldBNz1pVI9pRjY1F3aRwYNjUiEhm8zLOT0bgQSF
 QcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UT9FnFM5xebfMVQH8K7LhtU4hS4AAveJ9mOb4TNd+NE=;
 b=Y3WtFX5/awrOrJHZEKdFtUw+WF7tB6vVfEz70wewkZLwM/JcHRESANKozMUKzvcwxZ
 PRptZQiXws9kfgta1nH7+yDyf2n22+fIv9a+uJnlo/WsrWVAZRu7XFbS9XPTZRXDDZJ6
 fygAymekSniSdMEJSsWeKCwNBBiWmnhPdlyI+eF9Cb1UWe+Fkg2eEd5PPCjxUsCIMSoR
 UBnWQoAyY9fjJ9R68uTPWSsS5qPdwCEt7JKgbNVFrguSMSSyXqcUFEhuwQZpkR82gcGD
 Oj15QnMjnOIgVdELwizEjMzSquMWp/AEq4nGbVzG9WrD2mKbh2yob0Ql85NZAlIE5lIU
 +Xvg==
X-Gm-Message-State: AOAM5330TZpu+bYEPebFkUt4S3lpRJxKP5vnCuex0wgXXpSSWb0JRXUN
 qiShOKUlk81aST4gyECGCuE=
X-Google-Smtp-Source: ABdhPJxrz3KwVqGMYv9haGJYVVFgw7qa7llS3q37LpW+Lc8eFtLlsB+ymypQaoGSFQPJF0O1aMp/Gw==
X-Received: by 2002:a17:90a:ad87:: with SMTP id
 s7mr5568649pjq.225.1591831873500; 
 Wed, 10 Jun 2020 16:31:13 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id 5sm959682pfc.143.2020.06.10.16.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 16:31:12 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 11 Jun 2020 07:31:09 +0800
To: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <20200610233109.n6pxir5wba5u2f7u@r>
References: <83bc1b7a-ee84-d074-d04d-5fdb39e777f2@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83bc1b7a-ee84-d074-d04d-5fdb39e777f2@linuxfoundation.org>
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] New Linux Kernel mentorship projects
 accepting application
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Dear Shuah,

According to CommunityBridge, a link should be sent to me for a set of follow-on kernel coding tasks after finishing the LFD103 training. But I haven't received one three days after submitting LFD103 Certificate of Completion. Should I send this certificate to you instead?

On Wed, Jun 03, 2020 at 10:05:54AM -0600, Shuah Khan wrote:
>Two new Linux Kernel Mentorship projects
>
>LinuxLinux kernel Bug Fixing July-Sept 2020
>Linux kernel: Refurbishing make coccicheck
>
>are accepting applications now. The session starts on
>
>Please visit https://people.communitybridge.org/#projects for
>a full listing of projects and search for Linux in the search bar.
>
>thanks,
>-- Shuah
>_______________________________________________
>Linux-kernel-mentees mailing list
>Linux-kernel-mentees@lists.linuxfoundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

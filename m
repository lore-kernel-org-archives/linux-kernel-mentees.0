Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3915EC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 23:53:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDFD4207DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 23:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="p1xsv+Js"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDFD4207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CABAE88494;
	Tue, 21 Jul 2020 23:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJSfzlp8GhlK; Tue, 21 Jul 2020 23:53:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 701FE883FF;
	Tue, 21 Jul 2020 23:53:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56026C088E;
	Tue, 21 Jul 2020 23:53:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20A0EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 23:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B9E9A20365
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 23:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XZ6UCCAp4Pb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 23:53:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0FA3B20357
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 23:53:03 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o1so80471plk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 16:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9GAANOVEkg7Oss4DpDH0gr9ifNPUbhRTyDcGnsT2WTE=;
 b=p1xsv+JsYJXhYalj5ZZCc9wnW1uf56mVn0Gc1i+QWyJBhVm2oAo15ONIoGH5a++qc3
 nS8vtFYiWBbBZN/ZbGkIgOWNPX3q2HAp+ZRYAz0yz6yBgjgbaVNRv9jJYBy2nfqY++4s
 49RCXlqcN1Khtcr2FHPAlM6wIONJZ/uQkd34FX01Bue6DVy0I1d2B1vmNGTCO94yzDW+
 Fsd6zuBB7YB7X0nSbZNQjQSwkxI+h8rk5XJzp/8bgnBgal//1dKnFv7A0QGSbptnJ7tf
 1JcrpYnLejhIZ2RRFRpcz+Ki1fmJRs7nlyLeVDnnreujKpiOcnohfnZRviTLvcVEKJgB
 pezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9GAANOVEkg7Oss4DpDH0gr9ifNPUbhRTyDcGnsT2WTE=;
 b=IhvLzUze5y23guU5nGsmQytaA0EVv076MY6JFsJlEOwZYgKgn600HVHvjs/ofuQ5dS
 sevHrUFtRccDpkaSpCac0XASWELTVhdaERnvWAtHRbGnhLyaq9iB9aVSzShoYP84Hztx
 wAumAB6zX3VqbEuByEy4lHzCwma/KBbCMrB9tHFR47ZweK9MZtNOyPww75U3+1xvyM4M
 JUM33xcAb4mcRUXLBcXhdzU2w//R14Pgu8L7/cOCDqn7ej6OIQnwmgUU/8HeI+rcDIoM
 S5cTkB+Lkirtite3Wd5oiYn1+pzefTlLirovz7B8NXEbIqo6DRk5zzUOB8VwjD9suHiV
 02cw==
X-Gm-Message-State: AOAM5333nUkiCs1uFI8l6ryHchpbB7xjFFkLeoUsgxk0JkeVVBU3+MTN
 H9gaxNys2A1T6/qllMbtn44Bcr6Mm1fT/YXbvOLfWQ==
X-Google-Smtp-Source: ABdhPJwlgYLxoZWZx8+svKNEBY0q6bxsav7DHLE6pxfIoOZcXdRkc72QEfSINPDlzRr5arUe6DKa0UAUjzPNjGbgJMA=
X-Received: by 2002:a17:902:10e:: with SMTP id
 14mr23017886plb.297.1595375582338; 
 Tue, 21 Jul 2020 16:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200721174036.71072-1-vitor@massaru.org>
In-Reply-To: <20200721174036.71072-1-vitor@massaru.org>
Date: Tue, 21 Jul 2020 16:52:51 -0700
Message-ID: <CAFd5g45DrBCA2Oq0RCb5FDWybt9NnXj=tN7pZFqjMLhuWWQoew@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: kunit: Provides a
 userspace memory context when tests are compiled as module
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jul 21, 2020 at 10:40 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> KUnit test cases run on kthreads, and kthreads don't have an
> adddress space (current->mm is NULL), but processes have mm.
>
> The purpose of this patch is to allow to borrow mm to KUnit kthread
> after userspace is brought up, because we know that there are processes
> running, at least the process that loaded the module to borrow mm.
>
> This allows, for example, tests such as user_copy_kunit, which uses
> vm_mmap, which needs current->mm.
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

Isn't this a dependency for the test_user_copy? Also, don't we also
need the change that makes kunit_tool build modules? It seems like you
should put these together in a patchset like you did before. If not,
you should at least reference the dependencies in each patch.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

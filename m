Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03202C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 10:11:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520DE20848
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 10:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYXjmjg1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520DE20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A905D88B34;
	Fri, 16 Oct 2020 10:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cbiJ-d7sbNV9; Fri, 16 Oct 2020 10:11:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E7328836D;
	Fri, 16 Oct 2020 10:11:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B68AC07FF;
	Fri, 16 Oct 2020 10:11:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 382B6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 32C6E88B34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnfXxYWykXMx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:11:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 863CB8836D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 10:11:05 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k21so2999451ioa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VtiBOh2Ht47MPGja47Gi8tMP/aZ3aNK4q8kg57ELqSM=;
 b=JYXjmjg1h46hKJb0Gm0j938O1KLIQ+QyV61S0Fu1ACjXm2x7jhCfzYm4CtPCSpOu1L
 QxG/RAGTiyaTf7qFHrNRhkMQSF2yEjbFmDHfZ0nNIyIC3vbJ2Jc/22MKgG1ITjqUc7kM
 4cWztGi9w/SZBG6DQ4BhHG+25PDs+T96qHynK4GlFnKa5ff+KhyYt3L+h+vt6qe89u4Z
 p4kFOSSUdRS5u8b5BhLj5CP89QUG3TOIcfJrkkZ77c2PGhkBEJGHYcuXeTbeL1NLDUHM
 NAecGSuS9sUw3TKIhObabgDejjfP/r/1eALat1+LmDDxB0bdxpAmNfNHpK4rLU3sGOIG
 vL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VtiBOh2Ht47MPGja47Gi8tMP/aZ3aNK4q8kg57ELqSM=;
 b=hjkh0ASElO5l2ZVq80UUSWRgVZa+W6urkw7VphApFB3BI5tcXNoSs7vmczaTygc15G
 Mkz7atCgLEoWVrefDQdVZXbe7RyhlxEFpBu6ofupBJx8jZfHqNlP4lNXlKgArxzs+69u
 nxDIIdu9dNUbR7DQnQpqOy9ljVC7LbUNrMMoz8kFJmvnJpm5Szw4Q2BObNuf6xsodZMI
 5OMk0n1Wk623m2VMBnkbPcScEpGqNc0E8cbrfc5a7Or6aWrmfBuBSpx7jbZOHKzX+JkZ
 hr9YiSEtfSCDQPLzjhnFUodvmCsd4rILLrbc9FdLpk+T5E1bBR3aYqAhZgAm9qvXV48O
 UHtw==
X-Gm-Message-State: AOAM533gpTPHLx0P74B8bapvGEWGWWkRYQw/6fA5SbZU28pdpvI6IDOK
 pyEpl1z9kLKGYPGXqOsbng4ig8ZZN4ohMsdRYLQ=
X-Google-Smtp-Source: ABdhPJx87faFHExbfMxYq4oNwX9VpxiBK3YhMDgbA4pvQNVV9L3m5VVJ3PPuYI4GLguIg8/MM8nPBJXa/cBmmpcSzTk=
X-Received: by 2002:a5e:c112:: with SMTP id v18mr1825507iol.195.1602843064660; 
 Fri, 16 Oct 2020 03:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <049e1657-f895-a175-9108-314b0628d6aa@gmail.com>
In-Reply-To: <049e1657-f895-a175-9108-314b0628d6aa@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 16 Oct 2020 12:10:50 +0200
Message-ID: <CAKXUXMx64+XGnpKt-9VFNZLb8=hALWQxB1=A6O+4DpR+YaKrEw@mail.gmail.com>
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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
> Lukas, Ayush didn't follow up with next iteration of patches for
> GIT_COMMIT_ID related issues. And I had discovered a bug in his
> implementation. Is it okay if I look into the issue?
>

Dwaipayan already wanted to pick up the work on the GIT_COMMIT_ID issues.
So, he is working on that already.

> >
> > Just one bigger project example: Comparing clang-format suggestions on
> > patches against checkpatch.pl suggestions are fine-tuning both of them to fit to
> > the actual kernel style.
>
> I'm not familiar with how clang-format tool is used in the kernel
> repository. But I would like to know about it more and how I can
> contribute here. If there are any tasks that would help me get a
> direction please mention.
>

This is probably much more interesting to get involved in...

Some background information is in the kernel documentation; some
further information can be found on this presentation,
https://www.youtube.com/watch?v=FFjV9f_Ub9o, starting at 2:09.


You can start with running clang-format on the kernel sources just to
get a first feeling on what the tool does and where it completely
changes the code, and especially those cases where it changes code
that was perfectly okay before, we should do something to
adjust/configure clang-format.

Mid term goal: If we find a directory that needs no changes with
clang-format (after configuring), then it would be worth informing the
maintainers that clang-format works for them.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

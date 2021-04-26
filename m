Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E980C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 12:01:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4BCD61027
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 12:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4BCD61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59CBB4028F;
	Mon, 26 Apr 2021 12:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXHHRsb_KU4F; Mon, 26 Apr 2021 12:01:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47E3A40287;
	Mon, 26 Apr 2021 12:01:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B8C8C000F;
	Mon, 26 Apr 2021 12:01:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C6C3C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 12:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AB75605CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 12:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4TB5TZO9vw3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 12:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C82A605A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 12:01:15 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 g4-20020a9d6b040000b029029debbbb3ecso18843878otp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 05:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxIyZImAjQiKb779pF2r0agNe8VB6ArmqFWX32Kk7RQ=;
 b=L9Wd+uKO07KYzThS29QhmeubYUW6ocy1LpoF0ymRFWzZOuJOUNzNUlKrLu7pfKy3mi
 aMRDvy4rJl42bKqbpgcqR+nZPDKi6aJQku9RYg4szfwkITlSqpsNhi4wP5pLF2Tedpqs
 2DCha94EDEpBScBwz06lPOJtjZU92ehEVd2au5kbsbSZUXyepaY03g5ttmSk2uB5uF6m
 ugRqz/QeTJlkWeP1WCHeyNC6YkJ/6Fm/5B4GTkaE66CTdtatvZpcE/5dXWKM9tXec9uI
 8yKcCnQbY1hlEy1yE/GhaqI76twDujNKZyzY83vip2/XxFKTaGqU8CW/FBBzNm5wzvPd
 WZ2Q==
X-Gm-Message-State: AOAM533HgW2Or8KraHdqbtTeF99lmLtWF8bVvYZGMOEad69UKFIrdpgh
 5/18Au7agMzgqjBP0vFMox8KsJriYyg3sZWNq78=
X-Google-Smtp-Source: ABdhPJydX+PqSQ6N7W5WWSg0dAngJ4Psu2SduGfyCPpLs36pyCJue6ExqSiASIYQpVrKVzUuDwEF7jEN91qwbA+wOXo=
X-Received: by 2002:a05:6830:2458:: with SMTP id
 x24mr3478004otr.206.1619438473197; 
 Mon, 26 Apr 2021 05:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
 <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
 <YIZIHR0ZQPXFkOH1@unreal>
In-Reply-To: <YIZIHR0ZQPXFkOH1@unreal>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 26 Apr 2021 14:00:58 +0200
Message-ID: <CAJZ5v0gRv-1qYiN8EXx12iOiJvX7ORzqQfHvtWDnZLtpg6Aijg@mail.gmail.com>
Subject: Re: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
To: Leon Romanovsky <leon@kernel.org>
Cc: Anupama K Patil <anupamakpatil123@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, bkkarthik@pesu.pes.edu,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 kernelnewbies@kernelnewbies.org,
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

On Mon, Apr 26, 2021 at 6:57 AM Leon Romanovsky <leon@kernel.org> wrote:
>
> On Fri, Apr 23, 2021 at 03:08:03PM -0600, Shuah Khan wrote:
> > On 4/22/21 12:03 PM, Anupama K Patil wrote:
> > > de, e are two variables of the type 'struct proc_dir_entry'
> > > which can be removed to save memory. This also fixes a coding style
> > > issue reported by checkpatch where we are suggested to make assignment
> > > outside the if statement.
> > >
> >
> > Sounds like a reasonable change.
>
> It is unclear how much changes to ISA code are welcomed.

Real fixes and obvious cleanups are, not much more than that.

> According to the Wikipedia, even Windows Vista disabled ISA PnP by default.
> https://en.wikipedia.org/wiki/Legacy_Plug_and_Play#Specifications

It is indeed unclear how many systems with this interface still run
Linux, but as long as the code is in the tree, there's nothing wrong
with attempting to improve it.  There's no assurance that all such
patches will be applied, though.

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

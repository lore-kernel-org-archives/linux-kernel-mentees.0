Return-Path: <SRS0=0WDs=JY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34837C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 04:19:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC6A610FC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 04:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC6A610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65297403A3;
	Tue, 27 Apr 2021 04:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wg2ZO3MwOREU; Tue, 27 Apr 2021 04:19:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A7A7403A2;
	Tue, 27 Apr 2021 04:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1571BC000F;
	Tue, 27 Apr 2021 04:19:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3C5AC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 04:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AEF183BF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 04:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYaxMKDemgYb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 04:19:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7274083BD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 04:19:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F5376101B;
 Tue, 27 Apr 2021 04:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619497139;
 bh=phUkD5R4YFn2qjCnUc+u7gzmJYeDBiXnaqgZgTqXPYM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0J2hDcxul1U/sSEqJyjFGSLmz4KOQbE8gfSaGI18Dsu+tWFV3A9oSKYQq/g08wwq
 0YEDnkRNRrdNfcSY0Py71mjqODV6OoaO/mjrbcjWGFZg4mYYGS/omLN1CNyKfKqkjv
 uGhbjeWIZ9s5mj0/wtDt6COtTQtlpztKZJQ/P3gHtPtoF0vJcZ0b7C+Th3M6eSAd0K
 TDqcQWC9bC54/gCPteSYDfGoOYU5ZJgaNHf4hUmRC/uHZhjv458JeS6jTdSu0vaQA2
 dAZf1Ms17hHhduEpVPV4CiuRF380KA44g3eEdRKH96J84x1jg2yK9fvZFNycnDgIDU
 NX/5cY3ofz1Kg==
Date: Tue, 27 Apr 2021 07:18:55 +0300
From: Leon Romanovsky <leon@kernel.org>
To: bkkarthik <bkkarthik@pesu.pes.edu>
Subject: Re: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
Message-ID: <YIeQrwnAYMh2SV3g@unreal>
References: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
 <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
 <YIZIHR0ZQPXFkOH1@unreal>
 <CAJZ5v0gRv-1qYiN8EXx12iOiJvX7ORzqQfHvtWDnZLtpg6Aijg@mail.gmail.com>
 <YIa3H6kGFXiqWRtg@unreal>
 <20210426175254.g63l272o4hnagcs2@burgerking>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426175254.g63l272o4hnagcs2@burgerking>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Anupama K Patil <anupamakpatil123@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 kernelnewbies@kernelnewbies.org
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

On Mon, Apr 26, 2021 at 11:22:54PM +0530, bkkarthik wrote:
> On 21/04/26 03:50PM, Leon Romanovsky wrote:
> > On Mon, Apr 26, 2021 at 02:00:58PM +0200, Rafael J. Wysocki wrote:
> > > On Mon, Apr 26, 2021 at 6:57 AM Leon Romanovsky <leon@kernel.org> wrote:
> > > >
> > > > On Fri, Apr 23, 2021 at 03:08:03PM -0600, Shuah Khan wrote:
> > > > > On 4/22/21 12:03 PM, Anupama K Patil wrote:
> > > > > > de, e are two variables of the type 'struct proc_dir_entry'
> > > > > > which can be removed to save memory. This also fixes a coding style
> > > > > > issue reported by checkpatch where we are suggested to make assignment
> > > > > > outside the if statement.
> > > > > >
> > > > >
> > > > > Sounds like a reasonable change.
> > > >
> > > > It is unclear how much changes to ISA code are welcomed.
> 
> If changes to ISA code aren't welcomed, should these be marked obsolete in the MAINTIANERS file?

I think so, but think that "Odd Fixes" better describes that Rafael wrote.

Thanks
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

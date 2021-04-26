Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC64C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 12:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3799461289
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 12:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3799461289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C3C8399B;
	Mon, 26 Apr 2021 12:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id waXr4ElSsFCc; Mon, 26 Apr 2021 12:50:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E479C82D91;
	Mon, 26 Apr 2021 12:50:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4639C000F;
	Mon, 26 Apr 2021 12:50:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0561C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 12:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91984608DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 12:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5b4Y6GGwua1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 12:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF916608CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 12:50:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 887DE61263;
 Mon, 26 Apr 2021 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619441443;
 bh=+UIfj82Eja1iaPvUFhsFHLNdYK0D3biGGwRTghZsyp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1K9TR0r8XbPqxD5ER8f7KjbXX/krszkrTt3MFjHqoX6D1NRXw1rtJBw+vGiI88Xx
 Sv/pmrFaIbZw/OtP72As92Wih+VpuzjGmesriUA0J1EyY5ha+DHkA2BpdZOU5zD5rb
 nFUgAoBbovrDU2xvkzKSZttzUPKiw7tZhFRk+PBk/ZTxRSWKYaB3FQSfBhU9ZSEHnJ
 ynpy3Y2q7LYqg8LM1Yh3/AlERpxYGIEJT/MMZdoWaGUi1KXfttZo42z6wdBQhZR+hc
 CnNWjBEViDmyy0bGa5d5a7+j2Ln0zkg66UcYS7ncTkFePsrb+6Ib8Yat3C3m2S5xV/
 8k81I3mK1A+uw==
Date: Mon, 26 Apr 2021 15:50:39 +0300
From: Leon Romanovsky <leon@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
Message-ID: <YIa3H6kGFXiqWRtg@unreal>
References: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
 <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
 <YIZIHR0ZQPXFkOH1@unreal>
 <CAJZ5v0gRv-1qYiN8EXx12iOiJvX7ORzqQfHvtWDnZLtpg6Aijg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gRv-1qYiN8EXx12iOiJvX7ORzqQfHvtWDnZLtpg6Aijg@mail.gmail.com>
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

On Mon, Apr 26, 2021 at 02:00:58PM +0200, Rafael J. Wysocki wrote:
> On Mon, Apr 26, 2021 at 6:57 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Fri, Apr 23, 2021 at 03:08:03PM -0600, Shuah Khan wrote:
> > > On 4/22/21 12:03 PM, Anupama K Patil wrote:
> > > > de, e are two variables of the type 'struct proc_dir_entry'
> > > > which can be removed to save memory. This also fixes a coding style
> > > > issue reported by checkpatch where we are suggested to make assignment
> > > > outside the if statement.
> > > >
> > >
> > > Sounds like a reasonable change.
> >
> > It is unclear how much changes to ISA code are welcomed.
> 
> Real fixes and obvious cleanups are, not much more than that.

While first part is easy to determine, the second one is more blurry.

> 
> > According to the Wikipedia, even Windows Vista disabled ISA PnP by default.
> > https://en.wikipedia.org/wiki/Legacy_Plug_and_Play#Specifications
> 
> It is indeed unclear how many systems with this interface still run
> Linux, but as long as the code is in the tree, there's nothing wrong
> with attempting to improve it.  There's no assurance that all such
> patches will be applied, though.
> 
> Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

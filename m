Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7884FC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 04:57:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D2161263
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 04:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D2161263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD9D6403D0;
	Mon, 26 Apr 2021 04:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRpGXvO4PdqN; Mon, 26 Apr 2021 04:57:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90F29403CE;
	Mon, 26 Apr 2021 04:57:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 714A7C000F;
	Mon, 26 Apr 2021 04:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E30D1C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 04:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBBCC403CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 04:57:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xzULa6SJnKn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 04:57:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DE30403CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 04:57:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E3C861360;
 Mon, 26 Apr 2021 04:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619413025;
 bh=oF5wTcVUbe3ITjsBTum2WMqyBNYZSs4s3HRFniDzF6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gI1tY4u0dkEsqk7lL/9IJ+cSkvkBf7k+buPby21z5W+FJ88Et37I0dl4f3EPUDuY2
 yUbkiFZeXThhswjtaYrhM3GhJZuhODBqpQ33pGgjIWsnRWU6BB0jDXATgA+ks7Rk/Q
 Pk6P+qxevkaCaY5eUpvP5PHH/RAtH2v+1pUqDXJ9ncyXzDS8dAG0V8UXyVscg6iblp
 Ed28Bx219ANuJYhPvfmhHL3V+WOU8tHXD4YwNmsBBKJSK/7r4WPO4YtPvjLmVi/G6k
 uTd7IDE1oVNhReVEKp/m8xpI7v30iRsQRMcsVimJOmXHSJGhQ1iMRvYlKPJAcknDRi
 HMlgwGB1eeCyA==
Date: Mon, 26 Apr 2021 07:57:01 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
Message-ID: <YIZIHR0ZQPXFkOH1@unreal>
References: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
 <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
Cc: kernelnewbies@kernelnewbies.org,
 Anupama K Patil <anupamakpatil123@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, bkkarthik@pesu.pes.edu,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-acpi@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Fri, Apr 23, 2021 at 03:08:03PM -0600, Shuah Khan wrote:
> On 4/22/21 12:03 PM, Anupama K Patil wrote:
> > de, e are two variables of the type 'struct proc_dir_entry'
> > which can be removed to save memory. This also fixes a coding style
> > issue reported by checkpatch where we are suggested to make assignment
> > outside the if statement.
> > 
> 
> Sounds like a reasonable change.

It is unclear how much changes to ISA code are welcomed.
According to the Wikipedia, even Windows Vista disabled ISA PnP by default.
https://en.wikipedia.org/wiki/Legacy_Plug_and_Play#Specifications

> 
> > Signed-off-by: Anupama K Patil <anupamakpatil123@gmail.com>
> > ---
> >   drivers/pnp/isapnp/proc.c | 13 ++++++-------
> >   1 file changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pnp/isapnp/proc.c b/drivers/pnp/isapnp/proc.c
> > index 785a796430fa..1ae458c02656 100644
> > --- a/drivers/pnp/isapnp/proc.c
> > +++ b/drivers/pnp/isapnp/proc.c
> > @@ -57,21 +57,20 @@ static const struct proc_ops isapnp_proc_bus_proc_ops = {
> >   static int isapnp_proc_attach_device(struct pnp_dev *dev)
> >   {
> >   	struct pnp_card *bus = dev->card;
> > -	struct proc_dir_entry *de, *e;
> >   	char name[16];
> > -	if (!(de = bus->procdir)) {
> > +	if (!bus->procdir) {
> >   		sprintf(name, "%02x", bus->number);
> 
> It would make sense to change this to scnprintf()
> 
> > -		de = bus->procdir = proc_mkdir(name, isapnp_proc_bus_dir);
> > -		if (!de)
> > +		bus->procdir = proc_mkdir(name, isapnp_proc_bus_dir);
> > +		if (!bus->procdir)
> >   			return -ENOMEM;
> >   	}
> >   	sprintf(name, "%02x", dev->number);
> 
> It would make sense to change this to scnprintf()
> 
> > -	e = dev->procent = proc_create_data(name, S_IFREG | S_IRUGO, de,
> > +	dev->procent = proc_create_data(name, S_IFREG | S_IRUGO, bus->procdir,
> >   					    &isapnp_proc_bus_proc_ops, dev);
> > -	if (!e)
> > +	if (!dev->procent)
> >   		return -ENOMEM;
> 
> Shouldn't the procdir be deleted when proc_create_data() fails?

It needs but only if proc_mkdir() was called in this function.

Thanks

> 
> > -	proc_set_size(e, 256);
> > +	proc_set_size(dev->procent, 256);
> >   	return 0;
> >   }
> > 
> 
> Note that isapnp_proc_init() doesn't check isapnp_proc_attach_device()
> return and handle errors and cleanup.
> 
> thanks,
> -- Shuah
> 
> 
> 
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

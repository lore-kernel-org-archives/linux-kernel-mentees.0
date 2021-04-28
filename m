Return-Path: <SRS0=jYeA=JZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9D6C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 12:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460B3613EA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 12:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460B3613EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=perex.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D526E40147;
	Wed, 28 Apr 2021 12:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQHPIci6hK_L; Wed, 28 Apr 2021 12:23:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E34F400D9;
	Wed, 28 Apr 2021 12:23:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D71B6C0022;
	Wed, 28 Apr 2021 12:23:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B38CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 12:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31D3040147
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 12:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jg41-ozmUt4f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 12:23:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 810A4400D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 12:23:34 +0000 (UTC)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9D113A004B;
 Wed, 28 Apr 2021 14:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9D113A004B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1619612237; bh=jApOZ5WCX2DyFFc/CN9VUh3CS1nh2H/Au0dQM1cOiK8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=XNm9e7qQXhFZzcPm4dHc5DSFzi00z6lI+4d6CULDSDgTofAO6lDnZ6SjcVBeSLRG6
 Ru/X+/86QUzFXck9l4JPoSy8auC3do2xWZvINYSgKzdUPlQoUwoAGFoWwY362CyFZJ
 hcqz+vOmq9Ia2k6Wt4xid4UK8OmVGkODj+hucX6Q=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 28 Apr 2021 14:17:07 +0200 (CEST)
Subject: Re: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
To: Anupama K Patil <anupamakpatil123@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, Adam <developer@arusty.dev>,
 bkkarthik@pesu.pes.edu, gregkh@linuxfoundation.org,
 kernelnewbies@kernelnewbies.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b28f6a3d-0752-a85e-bfe0-a5eb8d92c229@perex.cz>
Date: Wed, 28 Apr 2021 14:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
Content-Language: en-US
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

Dne 22. 04. 21 v 20:03 Anupama K Patil napsal(a):
> de, e are two variables of the type 'struct proc_dir_entry'
> which can be removed to save memory. This also fixes a coding style
> issue reported by checkpatch where we are suggested to make assignment
> outside the if statement.
> 
> Signed-off-by: Anupama K Patil <anupamakpatil123@gmail.com>

The change is straight without any functionality modification.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> ---
>  drivers/pnp/isapnp/proc.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pnp/isapnp/proc.c b/drivers/pnp/isapnp/proc.c
> index 785a796430fa..1ae458c02656 100644
> --- a/drivers/pnp/isapnp/proc.c
> +++ b/drivers/pnp/isapnp/proc.c
> @@ -57,21 +57,20 @@ static const struct proc_ops isapnp_proc_bus_proc_ops = {
>  static int isapnp_proc_attach_device(struct pnp_dev *dev)
>  {
>  	struct pnp_card *bus = dev->card;
> -	struct proc_dir_entry *de, *e;
>  	char name[16];
>  
> -	if (!(de = bus->procdir)) {
> +	if (!bus->procdir) {
>  		sprintf(name, "%02x", bus->number);
> -		de = bus->procdir = proc_mkdir(name, isapnp_proc_bus_dir);
> -		if (!de)
> +		bus->procdir = proc_mkdir(name, isapnp_proc_bus_dir);
> +		if (!bus->procdir)
>  			return -ENOMEM;
>  	}
>  	sprintf(name, "%02x", dev->number);
> -	e = dev->procent = proc_create_data(name, S_IFREG | S_IRUGO, de,
> +	dev->procent = proc_create_data(name, S_IFREG | S_IRUGO, bus->procdir,
>  					    &isapnp_proc_bus_proc_ops, dev);
> -	if (!e)
> +	if (!dev->procent)
>  		return -ENOMEM;
> -	proc_set_size(e, 256);
> +	proc_set_size(dev->procent, 256);
>  	return 0;
>  }
>  
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

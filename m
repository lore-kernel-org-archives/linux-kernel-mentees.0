Return-Path: <SRS0=6KHC=JU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A6DC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 21:08:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 821EB613CB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 21:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 821EB613CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3CD4055D;
	Fri, 23 Apr 2021 21:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zONK1hRAQagB; Fri, 23 Apr 2021 21:08:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 419444055C;
	Fri, 23 Apr 2021 21:08:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28BACC000E;
	Fri, 23 Apr 2021 21:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAF6BC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 21:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 817FB6064F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 21:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E78E9Kb5q3Ps
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 21:08:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFFDB60603
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 21:08:05 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 e12-20020a056820060cb02901e94efc049dso6007023oow.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=A22TFll9Blm6PfGJntS755LasWSXUim+ApdH7q9KXpA=;
 b=R5TEIv7r4kLuU5GuMWuxRcVR6NDvYx2skoH8US3RTsgU/Fbp/2PVhgI2qB1oIuefno
 7jxT4w0OVfBtyKsNLQx3nU/NuBSntlMycnPfjjUb59ce/gDpthHN9M7whlXmWdynzzV4
 mE5U3vaTyTDVk98Qw56lnGFYnGuEwSIbthXUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A22TFll9Blm6PfGJntS755LasWSXUim+ApdH7q9KXpA=;
 b=T1Nw+sM+AUXhUSp7sQ4F7hvFp8weLSSJc8+3S3Vr0QLbn4uRbMTLx4dql3UUYXBFzZ
 7FLY6GlL+1pkdEUiOp4OOlt8P6NzOzn+iMR7+zrD71C1EaNv0J5kvmeWikfamgAg+Tjz
 bWMGr5lEgQH9toBdBL1JPb3oLqOZJgiAz6a5UIsOc46gC67R9GEUbl73Z6aVEweXSUe/
 NJJCmC9n6FVqjAm1ib36NbfYvqv7cxGfu7oV0ByvRP0SNTQGqws1bPCX5Zt20A5RSSpX
 HDfUXL14tm4hbOAS1yklKxxU3MXrURzq4OtbUGitPSjG6h+Yqzm8q2KCwYLNzSdDN24m
 uVlw==
X-Gm-Message-State: AOAM532Zez21MRt4uWBwV4FDekeuNbWU+w5GWI/LnztX1C84Pbos75MG
 sWdWRv/RPPmAtM/mu5iyI5oFZ9Qu
X-Google-Smtp-Source: ABdhPJzmW7K55h27yHhlG31k1T2j2EBi0KXXkEuGIYledi+3ZceYb0qhnae+2xECf/+H2U4zaV+zUA==
X-Received: by 2002:a4a:2f09:: with SMTP id p9mr4337857oop.70.1619212084733;
 Fri, 23 Apr 2021 14:08:04 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id r19sm1482819oie.58.2021.04.23.14.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 14:08:04 -0700 (PDT)
Subject: Re: [PATCH] drivers: pnp: proc.c: Removed unnecessary varibles
To: Anupama K Patil <anupamakpatil123@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Adam <developer@arusty.dev>, bkkarthik@pesu.pes.edu,
 gregkh@linuxfoundation.org, kernelnewbies@kernelnewbies.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20210422180322.7wlyg63kv3n2k6id@ubuntu>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ea09f455-a00f-a13d-29d8-e3f9790dba56@linuxfoundation.org>
Date: Fri, 23 Apr 2021 15:08:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 4/22/21 12:03 PM, Anupama K Patil wrote:
> de, e are two variables of the type 'struct proc_dir_entry'
> which can be removed to save memory. This also fixes a coding style
> issue reported by checkpatch where we are suggested to make assignment
> outside the if statement.
> 

Sounds like a reasonable change.

> Signed-off-by: Anupama K Patil <anupamakpatil123@gmail.com>
> ---
>   drivers/pnp/isapnp/proc.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pnp/isapnp/proc.c b/drivers/pnp/isapnp/proc.c
> index 785a796430fa..1ae458c02656 100644
> --- a/drivers/pnp/isapnp/proc.c
> +++ b/drivers/pnp/isapnp/proc.c
> @@ -57,21 +57,20 @@ static const struct proc_ops isapnp_proc_bus_proc_ops = {
>   static int isapnp_proc_attach_device(struct pnp_dev *dev)
>   {
>   	struct pnp_card *bus = dev->card;
> -	struct proc_dir_entry *de, *e;
>   	char name[16];
>   
> -	if (!(de = bus->procdir)) {
> +	if (!bus->procdir) {
>   		sprintf(name, "%02x", bus->number);

It would make sense to change this to scnprintf()

> -		de = bus->procdir = proc_mkdir(name, isapnp_proc_bus_dir);
> -		if (!de)
> +		bus->procdir = proc_mkdir(name, isapnp_proc_bus_dir);
> +		if (!bus->procdir)
>   			return -ENOMEM;
>   	}
>   	sprintf(name, "%02x", dev->number);

It would make sense to change this to scnprintf()

> -	e = dev->procent = proc_create_data(name, S_IFREG | S_IRUGO, de,
> +	dev->procent = proc_create_data(name, S_IFREG | S_IRUGO, bus->procdir,
>   					    &isapnp_proc_bus_proc_ops, dev);
> -	if (!e)
> +	if (!dev->procent)
>   		return -ENOMEM;

Shouldn't the procdir be deleted when proc_create_data() fails?

> -	proc_set_size(e, 256);
> +	proc_set_size(dev->procent, 256);
>   	return 0;
>   }
>   
> 

Note that isapnp_proc_init() doesn't check isapnp_proc_attach_device()
return and handle errors and cleanup.

thanks,
-- Shuah


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B08C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 12:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26CB7408E5;
	Mon, 15 Aug 2022 12:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26CB7408E5
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b1VEzYtV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCusBoME6odw; Mon, 15 Aug 2022 12:30:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D89E3405AC;
	Mon, 15 Aug 2022 12:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D89E3405AC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95000C0032;
	Mon, 15 Aug 2022 12:30:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17A3FC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 12:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF9F3408E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 12:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF9F3408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYJ7Z04_byTa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 12:30:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91C97405AC
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91C97405AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 12:30:54 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id q16so6386600pgq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8N0tZJ261i5HWc8SMb6PjhSY6p7VWzYFeTIP4nzrRk8=;
 b=b1VEzYtVLOWAkOAKzwtxHu0/dhDervAoBVp+iDeFrqBqqYvQgea5BC9AleuQ7U6n83
 pFbAzPEp4GiLFrrCVvV4qFxOhbUlQ4WMDyCuzCqOOwxwljV/c9auB3Tkj8eoW8aOTyys
 vIE6Th4LpTQMdHdli/19h0T4vFhtYAoSmEskq/n/QZh7rhaRwxKe0nRbciC21MvB8S/2
 HWlWBwS1b3GYCeQ6fw1ptUyJcXq1BYZVi2plVVIZbN95g/4usQEerhG3FCsEr8EgAbTV
 eWYKn2umZVbwM3L+EvzsLxrUXsrwfyznDHa75rdFrMXWVHrtc3uD5VaYEZFoU60hl99w
 LpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8N0tZJ261i5HWc8SMb6PjhSY6p7VWzYFeTIP4nzrRk8=;
 b=ttxHwdZk9z4ficr03+NgaWLRnEEClvnTk+E/V0IOkcoiLafSp3UWKlQCnCfFev0YMk
 wGaZMuyvuhCDopPJPEZQVh/eNQUHotCIR0l1lS9MG0LOMGw3RL3WDHxbT0pPCUjGD0Pb
 4Sy2L8Q30tEg+tXXNiwMtG4Mg+vEKkwy0cjjILd0ZAYFstxR1bVLKgxMT8s/jQfvqjeN
 13ixajP18DmkMCKD5qF7jhaQtR/Ujemlar6tM+ymRdU+AY/Lkq7vyrXlVfHsgA9MNd+T
 Ymrk9jW4Xtod4HLY1UCWOQS221sxNGwtsn0QLRQlqrG5FkVGUfRZl0FXY8wjzV9rIbxj
 bnQw==
X-Gm-Message-State: ACgBeo0gj5kD3ZM08AQrYoyJ8bk/cEwzxoA5JA+hFWEVPJ4DtAgFszx3
 iz0o+kqIFAU/TtOfgXR/P+Q=
X-Google-Smtp-Source: AA6agR6n+V5MTGdGpk2hwvi18leQKPRw9rMleuhjBbyrOaibWzPzTsNiVU8zXcFHe6aFt9r5FDsqRQ==
X-Received: by 2002:a05:6a00:c96:b0:52e:979c:dd63 with SMTP id
 a22-20020a056a000c9600b0052e979cdd63mr16400289pfv.50.1660566653967; 
 Mon, 15 Aug 2022 05:30:53 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.152])
 by smtp.gmail.com with ESMTPSA id
 z25-20020a656659000000b00419b66846fcsm5726173pgv.91.2022.08.15.05.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 05:30:53 -0700 (PDT)
Message-ID: <9b993aa6-f432-89f6-9195-05b584398df2@gmail.com>
Date: Mon, 15 Aug 2022 18:30:44 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <YvjEIjXg7KxtTT/0@kroah.com> <cc6560c3-98c2-bdb5-cfc3-b39d3675382e@gmail.com>
 <YvnpuK8phVyF7053@kroah.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <YvnpuK8phVyF7053@kroah.com>
Cc: alsa-devel@alsa-project.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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

On 8/15/22 12:37, Greg KH wrote:
> On Mon, Aug 15, 2022 at 10:08:07AM +0600, Khalid Masum wrote:
>> On 8/14/22 15:45, Greg KH wrote:
>>> On Sun, Aug 14, 2022 at 02:04:15PM +0600, Khalid Masum wrote:
>>>> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
>>>> populated with properties from FW node props. Make this happen by
>>>> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
>>>> the flag to store the multi_link value from intel_link_startup. Use
>>>> this flag to initialize bus->multi_link.
>>>>
>>>> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
>>>> ---
>>>> I do not think adding a new flag for fwnode_handle is a good idea.
>>>> So, what would be the best way to initialize bus->multilink with
>>>> fwnode props?
>>>>
>>>>     -- Khalid Masum
>>>>
>>>>    drivers/soundwire/bus.c   | 4 ++--
>>>>    drivers/soundwire/intel.c | 1 +
>>>>    include/linux/fwnode.h    | 1 +
>>>>    3 files changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>>>> index a2bfb0434a67..80df1672c60b 100644
>>>> --- a/drivers/soundwire/bus.c
>>>> +++ b/drivers/soundwire/bus.c
>>>> @@ -74,9 +74,9 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
>>>>    	/*
>>>>    	 * Initialize multi_link flag
>>>> -	 * TODO: populate this flag by reading property from FW node
>>>>    	 */
>>>> -	bus->multi_link = false;
>>>> +	bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
>>>> +		== FWNODE_FLAG_MULTI_LINKED;
> 
> I missed that this was an if statement here, please write this to be
> more obvious and readable.
> 
>>>>    	if (bus->ops->read_prop) {
>>>>    		ret = bus->ops->read_prop(bus);
>>>>    		if (ret < 0) {
>>>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>>>> index 505c5ef061e3..034d1c523ddf 100644
>>>> --- a/drivers/soundwire/intel.c
>>>> +++ b/drivers/soundwire/intel.c
>>>> @@ -1347,6 +1347,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>>>>    		 */
>>>>    		bus->multi_link = true;
>>>>    		bus->hw_sync_min_links = 1;
>>>> +		dev->fwnode->flags |= FWNODE_FLAG_MULTI_LINKED;
>>>>    	}
>>>>    	/* Initialize shim, controller */
>>>> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
>>>> index 9a81c4410b9f..446a52744953 100644
>>>> --- a/include/linux/fwnode.h
>>>> +++ b/include/linux/fwnode.h
>>>> @@ -32,6 +32,7 @@ struct device;
>>>>    #define FWNODE_FLAG_NOT_DEVICE			BIT(1)
>>>>    #define FWNODE_FLAG_INITIALIZED			BIT(2)
>>>>    #define FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD	BIT(3)
>>>> +#define FWNODE_FLAG_MULTI_LINKED		BIT(4)
>>>
>>> What does this commit actually change?
>>
>> The new flag will lets us save if the device has multilink in fwnode_handle
>> whenever needed.
>> Then for soundwire/intel, save the multi_link flag into fwnode during
>> startup.
>> Later at master_add, as written in todo, initialize the multilink flag with
>> fwnode's flag property.
> 
> And what does that allow to happen?  What changes with all of this?

As suggested by Pierre-Louis Bossart these changes are not necessary and 
the TODO is to be removed. Earlier my intention was to create a new flag 
that lets us know whether multi_link is to be read from 
sdw_bus_master_add just as instructed in TODO.

I shall send another patch, that removes the TODO, as suggested by 
Pierre-Louis Bossart.
> 
> thanks,
> 
> greg k-h

thanks,
   -- Khalid Masum

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

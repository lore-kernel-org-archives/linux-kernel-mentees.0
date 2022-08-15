Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE478C25B0E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 04:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ED7040904;
	Mon, 15 Aug 2022 04:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ED7040904
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K0mPaT+N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiWxAUfCczKx; Mon, 15 Aug 2022 04:08:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 434C540490;
	Mon, 15 Aug 2022 04:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434C540490
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BF3DC0032;
	Mon, 15 Aug 2022 04:08:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 033CBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 04:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3A8C60E56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 04:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A8C60E56
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K0mPaT+N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbiEwc-Nf8_0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 04:08:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E064D60E55
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E064D60E55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 04:08:16 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so5819573pjl.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 21:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8hntQHoZ9Gf9EapoG7OUHkjCCy7RUxfP8D6OFpiBLZE=;
 b=K0mPaT+Ne0sR56DQhZkB0bHdsZxqQQgYPtaXecGLmhyy89OMj07hkhf4ZjiHNxgMih
 2C/aj9sPPTJorIJmhN1KFwrfHO5IAmGLlaliYGD3OfwydJNc38oVL+il+TN/iNm4hevE
 3IrbI6fl4h05tlE9Vx0chJLS9IN9D5gltv/UZNERo4qsG8aj+WHDc+1fGZzthdBjoCFg
 X2b09EmknfCM4ejvoFzWn2GNl+540olVVmkE4dF1tnr16UHKVxHKgzGIDjl34Jq20g0u
 W1nsW9/EVC04ga9kSESpbx1j/9AhuFGYU+p7xsydnmJbiQ1CInBphFmwslnQX51zWBKR
 kPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8hntQHoZ9Gf9EapoG7OUHkjCCy7RUxfP8D6OFpiBLZE=;
 b=TbKS0Q9U6Z7kc1+GDYmL5bHDzDEM5SfWh3GAV1R3qoBehFA6tbN+0DzlHkz5Jq5C04
 s5Ls8G9v4lSSdakg0wz58X+EooFOuWHJU50psTJ1fe1TBJz3EW3S/L9BBqSSdYDWhePH
 nw0sprhuZjTPs5G8j1gnD12mzQAz7XxZb4SFA5asWzAPOX/zSopJWOjYjuYV8mWz9j6H
 hcLD8/CEHXGnFzWuuCBRiqDaKQmJhlHxbdlCjYw+uRgYXbrP03GTNK8vyH2gqI+46atP
 HDr+cS1h0L4KAo2DrpVPexXew1S+/AIL1oZF2oxh4gYPJAo/WfMog/nLMGgCO1e7wCjS
 BhJQ==
X-Gm-Message-State: ACgBeo0QA+6COwNSalfq4Z+GcA8vo/Jx8PTp2z/I4f3UwKIsf2ccYS7o
 hvHc5JLtrIZmVR6XOvXyL4Y=
X-Google-Smtp-Source: AA6agR5ZjWehLH23fBf8T62x3uR4J1jayTxfMTMd8U2E8rJ59TUX5AIiemdUO1NZSKljU005g3Z6GA==
X-Received: by 2002:a17:902:e811:b0:170:8af3:824d with SMTP id
 u17-20020a170902e81100b001708af3824dmr14932403plg.26.1660536496248; 
 Sun, 14 Aug 2022 21:08:16 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.148])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ce8200b0015e8d4eb1d7sm6152838plg.33.2022.08.14.21.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 21:08:15 -0700 (PDT)
Message-ID: <cc6560c3-98c2-bdb5-cfc3-b39d3675382e@gmail.com>
Date: Mon, 15 Aug 2022 10:08:07 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Greg KH <greg@kroah.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <YvjEIjXg7KxtTT/0@kroah.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <YvjEIjXg7KxtTT/0@kroah.com>
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

On 8/14/22 15:45, Greg KH wrote:
> On Sun, Aug 14, 2022 at 02:04:15PM +0600, Khalid Masum wrote:
>> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
>> populated with properties from FW node props. Make this happen by
>> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
>> the flag to store the multi_link value from intel_link_startup. Use
>> this flag to initialize bus->multi_link.
>>
>> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
>> ---
>> I do not think adding a new flag for fwnode_handle is a good idea.
>> So, what would be the best way to initialize bus->multilink with
>> fwnode props?
>>
>>    -- Khalid Masum
>>
>>   drivers/soundwire/bus.c   | 4 ++--
>>   drivers/soundwire/intel.c | 1 +
>>   include/linux/fwnode.h    | 1 +
>>   3 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index a2bfb0434a67..80df1672c60b 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -74,9 +74,9 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
>>   
>>   	/*
>>   	 * Initialize multi_link flag
>> -	 * TODO: populate this flag by reading property from FW node
>>   	 */
>> -	bus->multi_link = false;
>> +	bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
>> +		== FWNODE_FLAG_MULTI_LINKED;
>>   	if (bus->ops->read_prop) {
>>   		ret = bus->ops->read_prop(bus);
>>   		if (ret < 0) {
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index 505c5ef061e3..034d1c523ddf 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -1347,6 +1347,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>>   		 */
>>   		bus->multi_link = true;
>>   		bus->hw_sync_min_links = 1;
>> +		dev->fwnode->flags |= FWNODE_FLAG_MULTI_LINKED;
>>   	}
>>   
>>   	/* Initialize shim, controller */
>> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
>> index 9a81c4410b9f..446a52744953 100644
>> --- a/include/linux/fwnode.h
>> +++ b/include/linux/fwnode.h
>> @@ -32,6 +32,7 @@ struct device;
>>   #define FWNODE_FLAG_NOT_DEVICE			BIT(1)
>>   #define FWNODE_FLAG_INITIALIZED			BIT(2)
>>   #define FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD	BIT(3)
>> +#define FWNODE_FLAG_MULTI_LINKED		BIT(4)
> 
> What does this commit actually change?

The new flag will lets us save if the device has multilink in 
fwnode_handle whenever needed.
Then for soundwire/intel, save the multi_link flag into fwnode during 
startup.
Later at master_add, as written in todo, initialize the multilink flag 
with fwnode's flag property.

> 
> Did you test this on real hardware?

I did not test this on real hardware.
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

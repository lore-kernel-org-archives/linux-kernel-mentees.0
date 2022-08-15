Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC07C25B0E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 04:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CBB983F89;
	Mon, 15 Aug 2022 04:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CBB983F89
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EiZ46NWg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLlkSFU925rw; Mon, 15 Aug 2022 04:28:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3563483F84;
	Mon, 15 Aug 2022 04:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3563483F84
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13D12C0033;
	Mon, 15 Aug 2022 04:28:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 908F0C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 04:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5857883F89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 04:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5857883F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSoJ9IVLRjC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 04:28:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E55F83F84
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E55F83F84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 04:28:14 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso5809748pjl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 21:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=AxntZ5boEdqFqlgnkvj7nx9yV31SjrqxErxj02VUkgI=;
 b=EiZ46NWgWvaPrWGZpEefUGH8iyYRrNyxPcZFIYYXH1N8zjQloB6tCImzZpIVPLxywV
 vvyyCkK9dDeDt7iSwYZs5PMf3Bp037GUBrBFN01bWAJ72NpP06EtdZlV1FKXm653cwX1
 wo8o5GLfryMyJ+1ZnsFNTEeTf+sdzRGnYhiiFAJbNzKyCg7cKOTj46KZPv9lhejF+hys
 +f0JYi+/ciwR5SdnaOiW3IGj7nqdcuHuml0Nonjl2N2YXx4U61l5YaMx4ic3xRYZWWQO
 0F+OC0HTjyGxpiJOuxcqqEGO1U3lt/938nOLcJ09iB5MjBqOQuLp7rZmVVIdZOKk/eEe
 m0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=AxntZ5boEdqFqlgnkvj7nx9yV31SjrqxErxj02VUkgI=;
 b=K2azLgRAH4x4hJgSOgU1aG/ylNnWMESuiRj8fom9AEbM/MTYnFex6tDTGlTZZvJwXy
 XpEKXZdO6kLRZVpX6Pb/2fIx4Jkmlzivm+mywfGeSSUqQHI0hJkz9ixMGudrVkh1XG6x
 do+HqZIykJAkLDV7jhoxfvXF0XEzIgtGhGB3QEui8a3iB7loRulGC9wFRtx+xLBeOK7q
 UHJPQpxVbMEDSknQVw64nxdewYL/0B/84D/fZ8bUC1TNsQfyM+n0qF/P9Fd+zc4ksRby
 BZsV1+Ee+3Oe/UzXnUbdNwOrjOmVaRvap5ZZDePSvujrFAFKzRP/U6CwQk/J7oQM16Oc
 didQ==
X-Gm-Message-State: ACgBeo28tG0TwVNHrwtj/4Vf2iEj2Updfn8OE2v80WNTYsR0GlM8ZY6/
 0itIAvQqcA7wxSPVxXhDn74=
X-Google-Smtp-Source: AA6agR6MAp7+b/8FUDKU99TCqhom1gNdLqL4D9vAA6/sxWFPfnKjoyXgKgGz0y5SYQ1WL0Q+KddeKA==
X-Received: by 2002:a17:90b:4b91:b0:1f4:e116:8f1 with SMTP id
 lr17-20020a17090b4b9100b001f4e11608f1mr16664416pjb.121.1660537693908; 
 Sun, 14 Aug 2022 21:28:13 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.148])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902d38600b001709b9d292esm6118545pld.268.2022.08.14.21.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 21:28:13 -0700 (PDT)
Message-ID: <54dd86bd-416b-3048-9bd0-368afa3aaf2f@gmail.com>
Date: Mon, 15 Aug 2022 10:28:05 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
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

On 8/15/22 00:46, Andy Shevchenko wrote:
> On Sun, Aug 14, 2022 at 11:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>>
>> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
>> populated with properties from FW node props. Make this happen by
>> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
>> the flag to store the multi_link value from intel_link_startup. Use
>> this flag to initialize bus->multi_link.
> 
> ...
> 
>>          /*
>>           * Initialize multi_link flag
>> -        * TODO: populate this flag by reading property from FW node
>>           */
>> -       bus->multi_link = false;
>> +       bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
>> +               == FWNODE_FLAG_MULTI_LINKED;
> 
> NAK (as far as I understood the context of the comment and the change itself).
> 
> These flags are for devlink, we do not mix FW properties with those
> internal flags anyhow. The comment suggests that this should be az
> property. Also commit message doesn't explain the relation to devlink.
> 
That is a good information to know. Thanks.

I shall try to find out if I can somehow get multi_link's value from 
fwnode in any other way and look into devlink in the process.

If you have any suggestions regarding this TODO, please let me know.

Thanks,
   -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

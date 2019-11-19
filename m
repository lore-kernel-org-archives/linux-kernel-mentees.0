Return-Path: <SRS0=bPvr=ZL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BE8C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Nov 2019 13:36:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D895C222F2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Nov 2019 13:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrhrrF8V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D895C222F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A842086CDC;
	Tue, 19 Nov 2019 13:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8M1-0VO73em; Tue, 19 Nov 2019 13:36:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69E3E86C66;
	Tue, 19 Nov 2019 13:36:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 504E3C18DE;
	Tue, 19 Nov 2019 13:36:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C56AC07AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 13:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7490E227FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 13:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isS3baIj1m6e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 13:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id AC63E227F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 13:36:29 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w7so11770492plz.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2019 05:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sRIw6rp9Mc/Zdv75hs9vE0HKh/1jxjYXzfWj5KShO4o=;
 b=MrhrrF8VKUR53os//rbTAXNlYR381za1H7vFBS2zlR43gNP9tiyijNaDdSFPm1ylZG
 7BpsZiu0xUbFqrsK+ucimbYqFbLMaa12nDUf4kHzSThkSH6y+PteD6qYuW+oYdiiwSpg
 bN07C1TVSW7/jx1bNm+Bi0XpYBY64QsJbMqykRhmaczEolhgAG7qci5fr/cFvTUThXVt
 3iWjfxVJwDOZLxmacN1ZywbivHp1acfzctqa/aocOPR/NgBsqCLxWmSFXIh1OHnx91z4
 DGpouLhOKrqJtFvGo56iGd5qkMokxcqRHj0TAZqHP58nPcJZJ7Xd0F71eOTtQ3HRZbpi
 56kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sRIw6rp9Mc/Zdv75hs9vE0HKh/1jxjYXzfWj5KShO4o=;
 b=Qt2Ok97gGi+8Ca6Ek51tcxW8rYo9aGaVfstB+edaB3ADrYk89KCC4hqAnzGkVYasID
 H+dRuv/KkrfYXX5ih6V2EThcJobe6sD7g+6mIG8pD5V+Cwq6jjr+uMN0MughlnwR5XWc
 B+DmHm2rW5nl1UzI1tnF9xGyZ7c7hhob8Q6sthSF9/FjMef5g6bBaXrgeGhlOGNueN5b
 a+xxJwL4v5Xx1xOIa4fy7scrqUBPNZfo7ocELXdwCK5hBRGcwNl03RtOrOmoz4MgVLoU
 YTEbyJqZVMkWEoNqFjf89hBNiIBmNOn4hh3+zhQMd7vFi+xJ12cApjIKukQso0vWm8vR
 OYhA==
X-Gm-Message-State: APjAAAWh5dEw90myTHEH/JeoQKvcC/7+TInkE+I9khiQaiMZjn7h10PU
 C8RPisFwRMu4+P6/HHLR1E9eL0ULbaI=
X-Google-Smtp-Source: APXvYqwZOxMxDDzJWeLUQjB+1ez46gEs7a1oggH6mczLVLdIFC0C+jm5a6Ir578tmMYcqi/cLuuIXw==
X-Received: by 2002:a17:902:bd82:: with SMTP id
 q2mr35320894pls.106.1574170197473; 
 Tue, 19 Nov 2019 05:29:57 -0800 (PST)
Received: from ?IPv6:2405:4800:58c7:fb0:3103:9cb5:5896:cd6e?
 ([2405:4800:58c7:fb0:3103:9cb5:5896:cd6e])
 by smtp.gmail.com with ESMTPSA id r15sm26254360pfh.81.2019.11.19.05.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 05:29:56 -0800 (PST)
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20191105141807.27054-1-tranmanphong@gmail.com>
 <CAO-hwJ+cydMPQE_otc8-67=SDKmjac5RXsLs-9x6dH4YqA+DVQ@mail.gmail.com>
From: Phong Tran <tranmanphong@gmail.com>
Message-ID: <0407e8bb-bbf5-ec64-cdac-ef266f1ab391@gmail.com>
Date: Tue, 19 Nov 2019 20:29:49 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJ+cydMPQE_otc8-67=SDKmjac5RXsLs-9x6dH4YqA+DVQ@mail.gmail.com>
Content-Language: en-US
Cc: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] HID: hid-lg4ff: Fix uninit-value
	set_autocenter_default
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

On 11/18/19 4:43 PM, Benjamin Tissoires wrote:
> On Tue, Nov 5, 2019 at 3:18 PM Phong Tran <tranmanphong@gmail.com> wrote:
>>
>> syzbot found a problem using of uinit pointer in
>> lg4ff_set_autocenter_default().
>>
>> Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
>>
>> Tested by syzbot:
>>
>> https://groups.google.com/d/msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQAJ
> 
> This seems weird to me:
> 
> the syzbot link above is about `hid_get_drvdata(hid)`, and, as I read
> it, the possibility that hid might not have an initialized value.
> 

In the dashboard [1] shows
BUG: KMSAN: uninit-value in dev_get_drvdata include/linux/device.h:1388 
[inline]
BUG: KMSAN: uninit-value in hid_get_drvdata include/linux/hid.h:628 [inline]
BUG: KMSAN: uninit-value in lg4ff_set_autocenter_default+0x23a/0xa20 
drivers/hid/hid-lg4ff.c:477
base on that I did the initialization the pointer in the patch.

> Here you are changing the initialized values of value, entry and
> drv_data, all 3 are never used before their first assignment.
> 
> I have a feeling this particular syzbot check has already been fixed
> upstream by d9d4b1e46d95 "HID: Fix assumption that devices have
> inputs".
> 

I think the commit d9d4b1 fixed this report [2] by syzbot.

[1] https://syzkaller.appspot.com/bug?extid=1234691fec1b8ceba8b1
[2] https://syzkaller.appspot.com/bug?extid=403741a091bf41d4ae79

regards,
Phong.
> Cheers,
> Benjamin
> 
>>
>> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
>> ---
>>   drivers/hid/hid-lg4ff.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
>> index 5e6a0cef2a06..44dfd08b0c32 100644
>> --- a/drivers/hid/hid-lg4ff.c
>> +++ b/drivers/hid/hid-lg4ff.c
>> @@ -468,10 +468,10 @@ static int lg4ff_play(struct input_dev *dev, void *data, struct ff_effect *effec
>>   static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
>>   {
>>          struct hid_device *hid = input_get_drvdata(dev);
>> -       s32 *value;
>> +       s32 *value = NULL;
>>          u32 expand_a, expand_b;
>> -       struct lg4ff_device_entry *entry;
>> -       struct lg_drv_data *drv_data;
>> +       struct lg4ff_device_entry *entry = NULL;
>> +       struct lg_drv_data *drv_data = NULL;
>>          unsigned long flags;
>>
>>          drv_data = hid_get_drvdata(hid);
>> --
>> 2.20.1
>>
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

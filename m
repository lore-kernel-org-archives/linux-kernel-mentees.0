Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4A4C27C40
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 07:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27F56132D;
	Thu, 24 Aug 2023 07:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27F56132D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WK_Jz4j8MJNA; Thu, 24 Aug 2023 07:19:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BD9CF600B8;
	Thu, 24 Aug 2023 07:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD9CF600B8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C194C0071;
	Thu, 24 Aug 2023 07:19:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFED3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B7DD4035F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B7DD4035F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5tgzuaQuMiIf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:19:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B77FE4026B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77FE4026B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9543C63329;
 Thu, 24 Aug 2023 07:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53527C433C8;
 Thu, 24 Aug 2023 07:19:24 +0000 (UTC)
Message-ID: <2b05ceb2-5d95-63bf-fba8-16e68c64089b@xs4all.nl>
Date: Thu, 24 Aug 2023 09:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] UBSAN: shift-out-of-bounds in set_flicker
Content-Language: en-US, nl
To: Greg KH <greg@kroah.com>, coolrrsh@gmail.com
References: <20230824070630.8209-1-coolrrsh@gmail.com>
 <2023082425-argue-tartar-4652@gregkh>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <2023082425-argue-tartar-4652@gregkh>
Cc: linux-kernel@vger.kernel.org, slark_xiao@163.com,
 syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

On 24/08/2023 09:13, Greg KH wrote:
> On Thu, Aug 24, 2023 at 12:36:30PM +0530, coolrrsh@gmail.com wrote:
>> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>>
>> Syzkaller reported the following issue:
>>
>> UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27
>> shift exponent 245 is too large for 32-bit type 'int'
>>
>> shift-out-of-bounds error was triggered when variable 
>> 'sd->params.exposure.gain' is greater than the number of bits of int.
>> When the variable 'currentexp' is left shifted beyond 31 bits then
>> the error is produced. Therefore added the conditional expression to 
>> verify valid range.
>>
>> Tested via syzbot.
>>
>> Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com
>>
>> Link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73
>>
>> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> Please do not have blank lines beween these tags.
> 
> You also have trailing whitespace in your changelog text :(

And please mention the driver name in your subject! E.g. something like:

"media: gspca/cpia1: UBSAN: shift-out-of-bounds in set_flicker"

That way I can actually know that this is a patch for a driver that I
maintain.

Regards,

	Hans

> 
>> ---
>> v1->v2
>> changed the patch
>> changed commit message and tested with checkpatch 
>>
>> ---
>>  drivers/media/usb/gspca/cpia1.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
>> index 46ed95483e22..dafc522d5e7b 100644
>> --- a/drivers/media/usb/gspca/cpia1.c
>> +++ b/drivers/media/usb/gspca/cpia1.c
>> @@ -1028,6 +1028,8 @@ static int set_flicker(struct gspca_dev *gspca_dev, int on, int apply)
>>  			sd->params.exposure.expMode = 2;
>>  			sd->exposure_status = EXPOSURE_NORMAL;
>>  		}
>> +		if (sd->params.exposure.gain > 31)
>> +			return -1;
> 
> Do not make up error codes, please return a valid one and not a random
> negative number.  Unless -1 is a valid value for this function?
> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

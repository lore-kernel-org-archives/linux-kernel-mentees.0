Return-Path: <SRS0=XiGY=KA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_RED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F00C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 09:11:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC10613CD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 09:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC10613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72894401FD;
	Wed,  5 May 2021 09:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpFlg4WSnqao; Wed,  5 May 2021 09:11:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A1F9400CC;
	Wed,  5 May 2021 09:11:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62848C000E;
	Wed,  5 May 2021 09:11:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0280DC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 09:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7BC2400CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 09:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UehzJvMJA5kT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 09:11:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3151401FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 09:11:09 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id eDYdlkXMLyEWweDYglukBU; Wed, 05 May 2021 11:11:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1620205867; bh=SxgYb14ClndkCKGy9k2rbObXxdvwXYY3UatDeaUJVuw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=mSSx2oI+rD14wX/Qm6rXHTkbZp5E6KVIr2v7Y/ARJ9/bxeGyNAt3qZNG6PBVLxRsf
 fG5H2T9rJpWtfHd1VFE/uKd0NSeGCMz0+9x+g+gv8lAZt8ZnjNNfOxrcQgGeOx1fuw
 RNnWON/vSNQZeq4X2vyx9avs7EOSlFMWLXUSsXuJeI5XaLRfVLPnsNqZQyY5piObAO
 nk94E3VeJQSHsFEXlFvfz74VPHlOOUeWnpU0ZqfZ23uVxlApg0Q1NdcMpSl2tKSv4V
 tUy+hNQEhKilLBH1Lv08GD46tuAcNTIHwt9b0lVq8jvZAr8P5vhCoTUw2aVZ/hdh6H
 aK5+WurgJdJMg==
Subject: Re: [PATCH] media: gspca: stv06xx: Fix memleak in stv06xx subdrivers
To: Shuah Khan <skhan@linuxfoundation.org>,
 Pavel Skripkin <paskripkin@gmail.com>
References: <20210422160742.7166-1-atulgopinathan@gmail.com>
 <20210422215511.01489adb@gmail.com>
 <36f126fc-6a5e-a078-4cf0-c73d6795a111@linuxfoundation.org>
 <20210423234458.3f754de2@gmail.com>
 <4c22cfa5-5702-6181-0f9a-d1d8d4041156@linuxfoundation.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e8f45770-76c1-22d3-0960-03e2965b79ab@xs4all.nl>
Date: Wed, 5 May 2021 11:11:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <4c22cfa5-5702-6181-0f9a-d1d8d4041156@linuxfoundation.org>
Content-Language: en-US
X-CMAE-Envelope: MS4xfFtNF0AOKSec5MD9by5lOuaECiQ8FyLuep91fSEXbKDbjWNqLjdt+YfLJqNpk4I2vpTyPL+BEJhlJFJP2zENP6njY4zsa9WhIGnl0E0wMO6+xockKQ31
 l0eFT5/KSYtNLGbxbrGT8hsPsmF6gy73tvnMmLF8sB5wnskYrUnEBQp/BxRZh5Dwcfk7y2RpbZZNAiqC2o1hCt9G6QkOCXn7XjRUJjtKi+kqMf8THm1zMxwy
 HLeH4GrOrTbL5Vn4xloy1EYTv3eSwgn7o+Sdl5aAH0cwH4dtovT7fKAaVRaOZLNb0I7pvGYFcWAoUalLwMYgOxCjOykN/Q3fY7zirisR+9lQJ9Xqw3q3XJgU
 wsNw8glPWYBZLwaVkCDxMt34p0g29FIScneBLNy+Vtv5ZPcGZhCRS+2NdPZYGLZAiOrgN+6GHM2evp5FMF3YW/Xf32DDBPMRQpY1r5qxVePeyn9tNL9q1QIn
 4kbJtxEkUgqJH044RDjQRI8USpOkp/f27qQ40HH/c0ixKupd9ZibALBlpIJ5Imy1wWxF3CVZ4SFugnCDV/yusCjVLhd7xl7ulH3kLg==
Cc: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Atul Gopinathan <atulgopinathan@gmail.com>, mchehab@kernel.org,
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

On 23/04/2021 22:56, Shuah Khan wrote:
> On 4/23/21 2:44 PM, Pavel Skripkin wrote:
>> Hi!
>>
>> On Fri, 23 Apr 2021 14:19:15 -0600
>> Shuah Khan <skhan@linuxfoundation.org> wrote:
>>> On 4/22/21 12:55 PM, Pavel Skripkin wrote:
>>>> Hi!
>>>>
>>>> On Thu, 22 Apr 2021 21:37:42 +0530
>>>> Atul Gopinathan <atulgopinathan@gmail.com> wrote:
>>>>> During probing phase of a gspca driver in "gspca_dev_probe2()", the
>>>>> stv06xx subdrivers have certain sensor variants (namely, hdcs_1x00,
>>>>> hdcs_1020 and pb_0100) that allocate memory for their respective
>>>>> sensor which is passed to the "sd->sensor_priv" field. During the
>>>>> same probe routine, after "sensor_priv" allocation, there are
>>>>> chances of later functions invoked to fail which result in the
>>>>> probing routine to end immediately via "goto out" path. While
>>>>> doing so, the memory allocated earlier for the sensor isn't taken
>>>>> care of resulting in memory leak.
>>>>>
>>>>> Fix this by adding operations to the gspca, stv06xx and down to the
>>>>> sensor levels to free this allocated memory during gspca probe
>>>>> failure.
>>>>>
>>>>> -
>>>>> The current level of hierarchy looks something like this:
>>>>>
>>>>> 	gspca (main driver) represented by struct gspca_dev
>>>>> 	   |
>>>>> ___________|_____________________________________
>>>>> |	|	|	|	|		| (subdrivers)
>>>>> 			|			  represented
>>>>>    			stv06xx			  by
>>>>> "struct sd" |
>>>>>    	 _______________|_______________
>>>>>    	 |	|	|	|	|  (sensors)
>>>>> 	 	|			|
>>>>>    		hdcs_1x00/1020		pb01000
>>>>> 			|_________________|
>>>>> 				|
>>>>> 			These three sensor variants
>>>>> 			allocate memory for
>>>>> 			"sd->sensor_priv" field.
>>>>>
>>>>> Here, "struct gspca_dev" is the representation used in the top
>>>>> level. In the sub-driver levels, "gspca_dev" pointer is cast to
>>>>> "struct sd*", something like this:
>>>>>
>>>>> 	struct sd *sd = (struct sd *)gspca_dev;
>>>>>
>>>>> This is possible because the first field of "struct sd" is
>>>>> "gspca_dev":
>>>>>
>>>>> 	struct sd {
>>>>> 		struct gspca_dev;
>>>>> 		.
>>>>> 		.
>>>>> 	}
>>>>>
>>>>> Therefore, to deallocate the "sd->sensor_priv" fields from
>>>>> "gspca_dev_probe2()" which is at the top level, the patch creates
>>>>> operations for the subdrivers and sensors to be invoked from the
>>>>> gspca driver levels. These operations essentially free the
>>>>> "sd->sensor_priv" which were allocated by the "config" and
>>>>> "init_controls" operations in the case of stv06xx sub-drivers and
>>>>> the sensor levels.
>>>>>
>>>>> This patch doesn't affect other sub-drivers or even sensors who
>>>>> never allocate memory to "sensor_priv". It has also been tested by
>>>>> syzbot and it returned an "OK" result.
>>>>>
>>>>> https://syzkaller.appspot.com/bug?id=ab69427f2911374e5f0b347d0d7795bfe384016c
>>>>> -
>>>>>
>>>>> Fixes: 4c98834addfe ("V4L/DVB (10048): gspca - stv06xx: New
>>>>> subdriver.") Cc: stable@vger.kernel.org
>>>>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>> Reported-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
>>>>> Tested-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
>>>>> Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
>>>>
>>>> AFAIK, something similar is already applied to linux-media tree
>>>> https://git.linuxtv.org/media_tree.git/commit/?id=4f4e6644cd876c844cdb3bea2dd7051787d5ae25
>>>>
>>>
>>> Pavel,
>>>
>>> Does the above handle the other drivers hdcs_1x00/1020 and pb01000?
>>>
>>> Atul's patch handles those cases. If thoese code paths need to be
>>> fixes, Atul could do a patch on top of yours perhaps?
>>>
>>> thanks,
>>> -- Shuah
>>>
>>>
>>
>> It's not my patch. I've sent a patch sometime ago, but it was reject
>> by Mauro (we had a small discussion on linux-media mailing-list), then
>> Hans wrote the patch based on my leak discoverage.
>>
> 
> Yes my bad. :)
> 
>> I added Hans to CC, maybe, he will help :)
>>
> 
> Will wait for Hans to take a look.

Yes, my patch does the same as this patch, just a bit more concise.

I'll drop this one.

Regards,

	Hans

> 
> thanks,
> -- Shuah
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

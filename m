Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05400C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 09:06:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474AE20723
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 09:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODoDG/kS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 474AE20723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AAAFA888C7;
	Fri, 16 Oct 2020 09:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Wgk7Nv6ka-t; Fri, 16 Oct 2020 09:06:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87285888EA;
	Fri, 16 Oct 2020 09:06:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65370C0052;
	Fri, 16 Oct 2020 09:06:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0534C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 09:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D21A5882D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 09:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8LnNRWz7tZb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 09:05:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F041D882BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 09:05:57 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id a1so1121965pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 02:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IpqDahoR68UUXck5LlXEwx2RVxuP806sBF9yvpc7yzg=;
 b=ODoDG/kSZMJqozVsyuK1tcGW7uqJoew9A+hBByRsY29YA7k/n2zFBpEP1+B/jKWRo+
 cS04tSsXaQZSVusvfnYv6KFIVuVMgKL/xgRbda3F5cQkCSezNykUOT2hCY9b7ol12UTe
 oK9AO+nYQGWekRTGfOIHLWDr4EHBWDJOk3Z1IFdEOR0ExlZG9euaS2lLpieDPpQvi32W
 KiWsHwDjoY4oYdgymlaweq5nRmQYT75ka1Dk93VUWkCZ+rkORfhJzfbdpGPl6ezXS2zC
 hcOKvvoPd5gnkIarwZQoTpVQoJzZkzcXJMh8vqDF44eCjJlO6gKQapah4Vi9uR0dgNTj
 CLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IpqDahoR68UUXck5LlXEwx2RVxuP806sBF9yvpc7yzg=;
 b=Z+oKKF2n9e63lP3pYh6cCrXOefuwH3OkcOq5WsK5R7RFBWa/o6eVdGl8hZBPUOHzZQ
 As3uYNVaCtmVHOBsFmiJbvlObW0JCqpMMf596oK/IP6+iVhsjJ32YTh2/cORmA8aLDZN
 ovSYfxipWeg0jSjUDxo6/+yOQ6yUW+6DALljQ1RHYDpKSWXieHCZmPx62lkhVMQvbNPn
 ITAqWrVY9p8sA9+/Owohj+5/uAT6RbFBFpWYE83i+R10pLe8K5L6iB4etpxTUzvJET+U
 VT82oTiHXc1ZNfexLEuOyzCPChZIEVN3j9ipHIlaFpFDB5RNPPOgzj00t+XXI3VFJFkr
 Syfg==
X-Gm-Message-State: AOAM5309M7FxzXy1lAQzJGh3bay2y8qBN1Q4/GjDWG6NViyGRFrw/Rh/
 hXZOuoG904fx33zvWNO49cYLZaXTWr1N4Dtl
X-Google-Smtp-Source: ABdhPJzOWEIrStRbqb27CgFxqmoGYEkHcDQzZUBLns9zvPUUNVUDk2qdzr3D46QmOzpHkbkNCYUmdA==
X-Received: by 2002:a17:90a:d146:: with SMTP id
 t6mr3050850pjw.76.1602839156864; 
 Fri, 16 Oct 2020 02:05:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id h2sm2123296pjv.4.2020.10.16.02.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 02:05:56 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <049e1657-f895-a175-9108-314b0628d6aa@gmail.com>
Date: Fri, 16 Oct 2020 14:35:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010140734270.6186@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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

On 14/10/20 11:16 am, Lukas Bulwahn wrote:
> 
> 
> On Tue, 13 Oct 2020, Ujjwal Kumar wrote:
> 
>> checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
>> files. The script leverages filename extensions and its path in
>> the repository to decide whether to allow execute permissions on
>> the file or not.
>>
>> Based on current check conditions, a perl script file having
>> execute permissions, without '.pl' extension in its filename
>> and not belonging to 'scripts/' directory is reported as ERROR
>> which is a false positive.
>>
>> Adding a shebang check along with current conditions will make
>> the check more generalised and improve checkpatch reports.
>> To do so, without breaking the core design decision of checkpatch,
>> we can fetch the first line from the patch itself and match it for
>> a shebang pattern.
>>
>> There can be cases where the first line is not part of the patch.
>> For instance: a patch that only changes permissions without
>> changing any of the file content.
>> In that case there may be a false positive report but in the end we
>> will have less false positives as we will be handling some of the
>> unhandled cases.
>>
> 
> I get the intent of your addition. However:
> 
> I would bet that you only find one or two in a million commits, that would 
> actually benefit for this special check of a special case of a special 
> rule...
> 
> So given the added complexity of yet another 19 lines in checkpatch with 
> little benefit of lowering false positive reports, I would be against 
> inclusion.
> 
> You can provide convincing arguments with an evaluation, where you show 
> on how many commits this change would really make a difference...
> 
> It is probably better and simpler to just have a script checking for
> execute bits on all files in the repository on linux-next (with a list of 
> known intended executable files) and just report to you and then to the 
> developers when a new file with unintentional execute bit appeared.
> 
> Keep up the good work. I just fear this patch is a dead end.
> 
> There is still a lot of other issues you can contribute to.

Lukas, Ayush didn't follow up with next iteration of patches for 
GIT_COMMIT_ID related issues. And I had discovered a bug in his 
implementation. Is it okay if I look into the issue?

> 
> Just one bigger project example: Comparing clang-format suggestions on 
> patches against checkpatch.pl suggestions are fine-tuning both of them to fit to 
> the actual kernel style.

I'm not familiar with how clang-format tool is used in the kernel 
repository. But I would like to know about it more and how I can 
contribute here. If there are any tasks that would help me get a 
direction please mention.

> 
> Lukas
> 

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

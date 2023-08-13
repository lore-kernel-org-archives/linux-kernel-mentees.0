Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35621EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 12:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFA240982;
	Sun, 13 Aug 2023 12:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAFA240982
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UkI53Pnt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGijfU8QCRHZ; Sun, 13 Aug 2023 12:46:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A31DB40964;
	Sun, 13 Aug 2023 12:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31DB40964
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E53EC0072;
	Sun, 13 Aug 2023 12:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4D2AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 12:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F4AE819F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 12:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4AE819F6
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UkI53Pnt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_l6Un1NYpqJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 12:46:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A56EC819D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 12:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A56EC819D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691930783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBWpp4WcH1Of4gtytpz7Sy6Dwn85bunNSeompfy5hes=;
 b=UkI53PntapnN0JkOv7Imh+2InZPmVKC9RjS3I8M9XBzTlU96WnHZ8VbfzWJb0qI0uCt14j
 D5B0/6suJsThn1C9ifyuwDC5I4KHOSm/ARvhvd0AoQSdp8MfJuQm9weGnOKlYIU4RR/r/E
 PX5DphE95uYZNC+tlTmvYvFyokAYd3c=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-bNx91F2HNN-0nLqGRiaZHw-1; Sun, 13 Aug 2023 08:46:22 -0400
X-MC-Unique: bNx91F2HNN-0nLqGRiaZHw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fe27502459so3248232e87.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 05:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691930781; x=1692535581;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NBWpp4WcH1Of4gtytpz7Sy6Dwn85bunNSeompfy5hes=;
 b=exDAw5i3fPLGYoNX6nNOwQawe+Mmzrh0xDJVutWqc+arUPbWrF2WfflYGWK/ds4pQN
 DOLiBDwEqFjL59y/NMchjrmxhjNRbnwXntiukIIngDApB3ftQTSWClRCKX+ooCWVba33
 awZ+HybqeGQ1rAD7ACY9lSFD2DK98c/vWC8QA7bWAe9R5q0ToHWlgXLZuz0pNBwRm5TY
 WU0KGj4S8qW3I1SNZNNwGeN7r9/P9Rz/AthLGcrmqkLVS9i/+IPvmb63RMOn6wFgP7As
 W7gs5G5eSFw92+LAlRKc3u+CWl23dO7UrRTYwJCa5xohfgwxn3QxOwtJvSRV3axEnNt2
 VCRw==
X-Gm-Message-State: AOJu0YwrSUOx1XlvgwhE0IpkP3jxTKzXmXfF4HkvNHH4Y2zHlTbxhdwv
 //DyeIAezs2cYisIvhx4KHh3Mb1hZ04gWf0ug9f4NyFf/tyw7YEo3h0owGvemDDH6taXfFAzGy4
 14VmAQKutJcXhIpSSYetkEXuQze1pO74i09Y4+vRRvHYHERmt
X-Received: by 2002:a05:6512:3f1:b0:4fd:f876:d86 with SMTP id
 n17-20020a05651203f100b004fdf8760d86mr3921749lfq.50.1691930781193; 
 Sun, 13 Aug 2023 05:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/aL13iYl7Ki9U+aGv7HE/HV0NfqbZ5GExa67Y7/ib88f5ZVpWWJpIJOaWQTp6VPQRZzBG5g==
X-Received: by 2002:a05:6512:3f1:b0:4fd:f876:d86 with SMTP id
 n17-20020a05651203f100b004fdf8760d86mr3921745lfq.50.1691930780905; 
 Sun, 13 Aug 2023 05:46:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a17090622cc00b009929d998abcsm4529115eja.209.2023.08.13.05.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Aug 2023 05:46:20 -0700 (PDT)
Message-ID: <74589699-de7f-5d11-6988-b41583b341d4@redhat.com>
Date: Sun, 13 Aug 2023 14:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] platform: sps: Fix an unsigned comparison that can
 never be negative
To: coolrrsh@gmail.com, Shyam-sundar.S-k@amd.com, markgross@kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230813110841.130206-1-coolrrsh@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230813110841.130206-1-coolrrsh@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Hi,

On 8/13/23 13:08, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> The variable 'mode' is declared as unsigned int in local function.
> The return value of function amd_pmf_get_pprof_modes(dev) is int and
> it is stored in the 'mode' variable. Also the value of 'mode' variable
> is compared with 0 which is signed int by default. Thus redeclaring the
> variable to signed int.
> 
> This fixes warning such as:
> drivers/platform/x86/amd/pmf/sps.c:128:5-9:
> WARNING: Unsigned expression compared with zero: mode < 0
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

Thank you your patch.

This has already been fixed by a patch which is pending in the pdx86/fixes branch:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=785c00993dc4c4bb2f7b0f3a3f29c03a6f7aab2e
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Regards,

Hans



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

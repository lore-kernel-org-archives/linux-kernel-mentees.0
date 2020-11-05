Return-Path: <SRS0=u7S/=EL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103F2C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 02:26:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693D7206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 02:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmApw21x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 693D7206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D17CA85C19;
	Thu,  5 Nov 2020 02:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTNSjOCpco65; Thu,  5 Nov 2020 02:26:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3862B85BCE;
	Thu,  5 Nov 2020 02:26:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 316B6C088B;
	Thu,  5 Nov 2020 02:26:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 560F1C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 02:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4F67D85C19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 02:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtyYdLKeOyZP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 02:26:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 83A6585BCE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 02:26:14 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x13so137472pfa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Nov 2020 18:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aN2VJlOwLJDzq5SW3NAeCQ4IQzHScs1tSJ+sWZ4PuuE=;
 b=cmApw21x6XMxEXGLvq0E/VHQ5RQ5zN1kYwizsAUJbtXZC6BpIc/Ou/vL0ZjJ+fnHrN
 kH/ESE5lPiUOBwchmb2U0JJ/tkAQMcYPAlVEk7UrcCGayeX2iaXk0O9NNV3hWPH1yha7
 XzdQ67B6j515pZVC9GIzpshAk8fAGXGs2s7Clj+SyGeF22ya9DfsnnglgMNlVHAUClI/
 Lepoy67FE4s5BKHKpLzP4SdkSRF5VTS5IiWAtjbHwPhDQnmayyMepPHkcoGFRhr63uBL
 juOPRs6xHJBEm3vQN8rm3HB+dNbiNO9qgJtqCFuw018xmhZpYEaXUxiuIhU64y6UC8ay
 l5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aN2VJlOwLJDzq5SW3NAeCQ4IQzHScs1tSJ+sWZ4PuuE=;
 b=nQG9cTpz0t/JLxl5FWUJgGjEgLMtNP2X5AhfLVM/hHmMI2CeKjbMWfOKyJ5ZWIa13m
 +NrgqPemhJyYcouAeMNEVa9WaIyJ9T+kubjqQjat91qahhYMQCKJstGG0jM4+8tsikn8
 DRMPXHTcIyfbZP/AMaxb7D5JxNvQErU9IqMGDoNDWFidv/NGSXXS2plOUkvKQ87CaD4I
 sU5JlHXWX4NKF9Ee0h+wSwUk9E6BFzKuGnNe3MABQzCF2AMY8isbqqDneZ5MfNOgI+VV
 D9L17TF2nqYZp1VYKYfOr2v0TlUAa0rSwLjqF3UgPCv8JLyW6aW0mtvuJfqJCwPOcyn8
 3SKQ==
X-Gm-Message-State: AOAM532uaQI3QDA2wOITbLDaatU0qbemCK9CrtwIEso5t8aqYxo/Pk+O
 bmLGZbR3pW13euyfRbAUYTzIdHB/pMPrxI1jwvM=
X-Google-Smtp-Source: ABdhPJxedl4jUMzUMl4EsKLOilb+nrQqtC+i0oWgXRlmi8E85vynkCFiwkEY3jGq9+pVrKTDZ6WATw==
X-Received: by 2002:a17:90a:aa85:: with SMTP id
 l5mr123666pjq.119.1604543173469; 
 Wed, 04 Nov 2020 18:26:13 -0800 (PST)
Received: from [192.168.0.104] ([49.207.201.182])
 by smtp.gmail.com with ESMTPSA id e10sm197790pfl.162.2020.11.04.18.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 18:26:12 -0800 (PST)
To: Jakub Kicinski <kuba@kernel.org>
References: <20201102173946.13800-1-anant.thazhemadam@gmail.com>
 <20201104162444.66b5cc56@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <dc3a4901-9aad-3064-4131-bc3fc82f965f@gmail.com>
Date: Thu, 5 Nov 2020 07:56:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104162444.66b5cc56@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [RESEND PATCH v3] net: usb: usbnet:
 update __usbnet_{read|write}_cmd() to use new API
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


On 05/11/20 5:54 am, Jakub Kicinski wrote:
> On Mon,  2 Nov 2020 23:09:46 +0530 Anant Thazhemadam wrote:
>> Currently, __usbnet_{read|write}_cmd() use usb_control_msg().
>> However, this could lead to potential partial reads/writes being
>> considered valid, and since most of the callers of
>> usbnet_{read|write}_cmd() don't take partial reads/writes into account
>> (only checking for negative error number is done), and this can lead to
>> issues.
>>
>> However, the new usb_control_msg_{send|recv}() APIs don't allow partial
>> reads and writes.
>> Using the new APIs also relaxes the return value checking that must
>> be done after usbnet_{read|write}_cmd() is called.
>>
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> So you're changing the semantics without updating the callers?
>
> I'm confused. 
>
> Is this supposed to be applied to some tree which already has the
> callers fixed?
>
> At a quick scan at least drivers/net/usb/plusb.c* would get confused 
> as it compares the return value to zero and 0 used to mean "nothing
> transferred", now it means "all good", no? 
>
> * I haven't looked at all the other callers

I see. I checked most of the callers that directly called the functions,
but it seems to have slipped my mind that these callers were also
wrappers, and to check the callers for these wrapper.
I apologize for the oversight.
I'll perform a more in-depth analysis of all the callers, fix this mistake,
and send in a patch series instead, that update all the callers too.
Would that be alright?

Thank you for your time.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

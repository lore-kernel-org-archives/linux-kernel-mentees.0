Return-Path: <SRS0=/60u=EZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B126C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 10:44:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C05FB2225B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 10:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKC5ybcB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C05FB2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 38437204E9;
	Thu, 19 Nov 2020 10:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hg9vh0dy2+4; Thu, 19 Nov 2020 10:44:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AE479204E3;
	Thu, 19 Nov 2020 10:44:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91770C1825;
	Thu, 19 Nov 2020 10:44:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6528CC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 10:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C23487332
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 10:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTa1H8+grmHb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 10:44:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BEC7A87275
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 10:44:12 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 10so4097909pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 02:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYNYrnHRn4JI8q1SmjUwr+6thZZk9cPXplEdzJQnm/M=;
 b=pKC5ybcBOzMnhyEeCEfCCEFm7U6GhKYUwmxKf8gKLKz3zIwgd/Eeg9SlpRt0utnA0y
 Qp1zFpZ+TxEW+a2aKn8Oi9vNz2e6QB+W2lW53BnpOlBSNU0JpA2iu7WH/dGZmPkK0Guq
 YTG8q3u+++pDpdUjNCyPtgp3+PFKOvZmL/N/D+C1jRQkRh0bU4SjKNf40XfLbbhX8VSg
 QtgL8pqtNTY0vfSFbmC2IhwAkyXbAqIZ8f8Rh9LY7bJMQxKNPPgdMAWoApxKWXIjD8CY
 j3s5hRd3dCZ7SBYR+vR6nD3J/B0AFiaif+GzQjgrckCSYWpiiulh7UrSlHI4DsxboUV2
 Ix+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYNYrnHRn4JI8q1SmjUwr+6thZZk9cPXplEdzJQnm/M=;
 b=DjFf3rKaIHrERPDEVeGtOCbJtde+kS3WudKQ0pZlnbScl4nVOWZvTdBA5Uuue2hzwT
 NAbxC/VVBBM//oeKU28a1zBr1Uv38N2uEeSVm8EorApIdyXmkn1TGVrI5p08FQdIhx+p
 zwmWjWSLo1E/d2Du6trYMO8NsjLi1DzlViNzo9vIoIuxH00XpKoZVucbkSYMuxMkq/qx
 ypnJvt0axe/28lrfwJ4mluYHT3mXqeRsuLE57uoPeIJwVtI6+s6DevB+SQbKkDAkW77A
 HEqvoDKbeSTcH+pNcm4KEt+tHTzm17XuqR9LEyB86M0kGyLtkLLAs4H0dPWS0e4HZPB2
 xY6Q==
X-Gm-Message-State: AOAM532I4dDRimpbdfeXDcNzT255A/mruR1MfxY3ErdeMTJKkO+PdnJE
 2W/vTvhbnqpJah8thmRzPLMjdbtKuqOOufrZ
X-Google-Smtp-Source: ABdhPJyo1oFJqWWkxioeB4ZByiVdF00OwP3gCjbC2vHeSOh1DZqHSu4tKV6ISYPjaOXIYC8olzzSvg==
X-Received: by 2002:a63:db50:: with SMTP id x16mr12193426pgi.205.1605782651972; 
 Thu, 19 Nov 2020 02:44:11 -0800 (PST)
Received: from ?IPv6:2402:3a80:40b:78c1:cd74:e812:328:9205?
 ([2402:3a80:40b:78c1:cd74:e812:328:9205])
 by smtp.gmail.com with ESMTPSA id fz5sm6239699pjb.49.2020.11.19.02.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 02:44:11 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
 <20201118173950.32660-1-yashsri421@gmail.com>
 <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
Date: Thu, 19 Nov 2020 16:14:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
 for NETWORKING_BLOCK_COMMENT_STYLE
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

On 19/11/20 12:30 am, Lukas Bulwahn wrote:
> On Mi., 18. Nov. 2020 at 18:40, Aditya Srivastava <yashsri421@gmail.com>
> wrote:
> 
>> Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
>> if we use an empty '/*' line for comment and contents of comments are
>> in next line
>>
>> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
>> the refs / unrefs from the transport") reports this warning:
>>
>> WARNING: networking block comments don't use an empty /* line, use /*
>> Comment...
>> +               /*
>> +                * If the TXQ is active, then set the timer, if not,
>>
>> Provide a fix by appending the current line contents to previous line
>> and removing the current line
>>
> 
> Patch generally looks good.
> 
> Can you check how many comments in net actually follow that style and how
> many follow another style?
> 
> 

In drivers/net:
Wrong style: 14695 lines
Correct style: 147961 lines (ie around 10 times)

In net/:
Wrong style: 5090 lines
Correct style: 30485 lines

There is also a documentation regarding this different comment format,
and can be found here:
https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

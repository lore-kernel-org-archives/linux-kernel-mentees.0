Return-Path: <SRS0=yLM5=NK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BFCC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 09:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C91B60230
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 09:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C91B60230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22EA480CE3;
	Thu, 19 Aug 2021 09:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2FcYeFsgvxv; Thu, 19 Aug 2021 09:40:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 486E180CB1;
	Thu, 19 Aug 2021 09:40:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25749C0010;
	Thu, 19 Aug 2021 09:40:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26E7EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 09:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EEDD80CBA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 09:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBcXuYzbNHb3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 09:40:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AA8A80CB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 09:40:57 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id n18so5362709pgm.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cSp9NwnxyOgzJbrJbt1VGvD7OEziQgHeU2j99tNdlpo=;
 b=sQSaBnD6DGdXEu4FJn47XGvy9Us77bXl/nsDwl6TW3a5px8jRAmU5BnUTv35j7bPuY
 3ApUSU1sSc6EbAjTwbK0Pdg0Di3V4k2gIYVQt/l5ftJDfHoRmjl/f6HYf/9xefPrpYcf
 RvaaxlHcuL6K0AXxLaEjKCR2sHDRQ9ZmMi6gr4Dx58cfT5qWoQdO9ifYvKJjgKC4tHVQ
 5xHuZPlf3GBgkLrkmlW55FO7UN0AFNo65cCdcvOIuMsOS3FCTM7ASuOZXC/ohR861vKP
 5uiSuzSapT3AKJ1seorxrgJ8EfSO+dO1GvcAr719X04oAGT5GnR84dv75OOVQyDhAWaI
 ywbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cSp9NwnxyOgzJbrJbt1VGvD7OEziQgHeU2j99tNdlpo=;
 b=VabIBxEkd8LrOjIzJszulgBXBMN6Yn6IjCNOVrXdD7RU1Dsds+fF6zM/iMue7HS2/5
 iQL+WhFEHoDQTI4wU9ZjxOhC+XT3h1UWVUSw8ze7yWhk+yh4Hpv0dEfU84/5LT46DceV
 cN4qIDhByxTyv+Z6rM6z0uah6iZ4ZZx5CaVYQuI02RoBRPbW0ZI4e+BGLpo6QfGUdffl
 nYNMhAFJAeIpSoTcPfLjSxTzFf6t4ymnCBukfR9pWVsCL1DfWW0ZxZgjRTmftURWGgp3
 EjbfTLNwqTGAbesWbJIOLRYAUjyF/2PGrPM2mUPa23kml6ahqIoU+Aea6a7u8guBmsJf
 q82Q==
X-Gm-Message-State: AOAM532yonlaA9uVVgFV5h8tMYUR1SS2PgG6aLS0Eq55vfiscHi2m2+g
 7Spe2M2SjHrnTrrtEwFEuqY=
X-Google-Smtp-Source: ABdhPJxq85oVvDdy2A3J4ATn8gQFyT/xNOQ1HXI/IX1f0Jg4ari85I+VOJhHYh8682YWHufRJFmglQ==
X-Received: by 2002:a63:de01:: with SMTP id f1mr1177149pgg.377.1629366057013; 
 Thu, 19 Aug 2021 02:40:57 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id r14sm2740127pff.106.2021.08.19.02.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 02:40:56 -0700 (PDT)
Subject: Re: [PATCH v3 8/9] kernel: export task_work_add
To: Christoph Hellwig <hch@infradead.org>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-9-desmondcheongzx@gmail.com>
 <YR4jqvZtu0gbaVmx@infradead.org>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <71c8e827-92f2-f34a-c9a6-9fc6923d315f@gmail.com>
Date: Thu, 19 Aug 2021 17:40:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR4jqvZtu0gbaVmx@infradead.org>
Content-Language: en-US
Cc: axboe@kernel.dk, walter-zh.wu@mediatek.com, tzimmermann@suse.de,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 oleg@redhat.com, mripard@kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, sumit.semwal@linaro.org,
 dvyukov@google.com, linux-media@vger.kernel.org
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

On 19/8/21 5:26 pm, Christoph Hellwig wrote:
> On Wed, Aug 18, 2021 at 03:38:23PM +0800, Desmond Cheong Zhi Xi wrote:
>> +EXPORT_SYMBOL(task_work_add);
> 
> EXPORT_SYMBOL_GPL for this kinds of functionality, please.
> 

Thanks, I wasn't aware of the GPL-only export. I'll update this in a 
future series if we still need the export.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27462C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Dec 2021 13:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD8A2404B2;
	Tue, 14 Dec 2021 13:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3uoqEV1kYxu; Tue, 14 Dec 2021 13:59:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C8CDD400DA;
	Tue, 14 Dec 2021 13:59:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A25ACC002F;
	Tue, 14 Dec 2021 13:59:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B31AC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 13:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF0A7404B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 13:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id utAViy-pHw0y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 13:59:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F452400DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 13:59:13 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id r2so17495906ilb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 05:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vkt27jyKBc5TiS5qbM/sF3Ng+qiD9oaD9dpLTZFgFPg=;
 b=kCqmAyxLCtc04xEUN622f2pBz4Sq5b3enBRS2WBkOfvzwPxyhZfT/xTcxVBQI7Ro+C
 GMxC6qdBC8qslybcmpMnhV9JUVcL51Fh7OCNrXxWx74ljsvFLlkSz7QJIy+GJywgQhPm
 80Mlb/xVqO6y2sKI/M6zY7QwlUAgX86e0LYpN4nA5qv6MdSl+8GvWKEGjpqPAWUNOnms
 CJyQ18nl+nT+h/Agh3i3iTcEcaTggSq8bBWQxkNCI/i+VETqWOtABVk1KJFop+hCr1t2
 gH7ytI82UxhJG7Qduh997UggOPKpEvGHdgDAKfbAULnmF+La/UaZDsCG/TlBqvenQVPj
 KJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vkt27jyKBc5TiS5qbM/sF3Ng+qiD9oaD9dpLTZFgFPg=;
 b=qZACRzmcL2pNmQOCRzPZJgEirKkvQsnZkWU1y0q2mr8Edkrr+mFQMYqVpTWTrCul6N
 3zTLmvazhHtixzzHnEfodp4o6nLkXxnuVGBu8LxO1vkv8yhzgBkmU2jYP0I21PkaQIMv
 MoEsP1cFh/L/fzHyXFUSD23auKn/Vkeu47l0o9IASLoUtkIfpjqX6eGeT6LDz+Z1uQ1g
 e8IqMvYTirsty05kpnOBVkB0DIty+G87/GGnyg3gcIFqE0H7KB53Gx8FMK8ik6brxBpg
 WLjTcfCidw1PxWBZrP1B1T9RpBTJ3IYr+4tsr0akHDWmgcaol53MQGhjQ2Ghp3+tyszD
 UIjA==
X-Gm-Message-State: AOAM532AIpq46K24w4SOtZdVk+WluoCH06fVSASQ/YMKFZg8zi+sCAEr
 beqPfNhhdbroeHi5NWFw5MxCbw==
X-Google-Smtp-Source: ABdhPJyT+360tMyccVsA34sWxQ0fjtyqpQ95UeHJXv9okxV27P74TnPV2Qys2chTJBB++ikJ8jqMRw==
X-Received: by 2002:a05:6e02:1be5:: with SMTP id
 y5mr3679166ilv.156.1639490352892; 
 Tue, 14 Dec 2021 05:59:12 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id x7sm8894631ilq.86.2021.12.14.05.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:59:12 -0800 (PST)
Subject: Re: [PATCH v5 4/4] rsxx: Drop PCI legacy power management
To: Christoph Hellwig <hch@infradead.org>, Bjorn Helgaas <helgaas@kernel.org>
References: <20211208192449.146076-1-helgaas@kernel.org>
 <20211208192449.146076-5-helgaas@kernel.org> <YbhN69IhTbGhvVeD@infradead.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <4c856b61-6e16-1943-c816-3736b872aa06@kernel.dk>
Date: Tue, 14 Dec 2021 06:59:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YbhN69IhTbGhvVeD@infradead.org>
Content-Language: en-US
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Philip Kelleher <pjk1939@linux.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Joshua Morris <josh.h.morris@us.ibm.com>
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

On 12/14/21 12:55 AM, Christoph Hellwig wrote:
> Maybe it is time to just drop this driver?  It was never widly used,
> seems unmaintained and uses a cumbersome own queueing layer instead
> of blk-mq.

I think so, but let's do that independently of this series.

-- 
Jens Axboe

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

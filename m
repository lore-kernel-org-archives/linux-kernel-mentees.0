Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A5FC6369E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 22:59:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8104221FD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 22:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8104221FD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 29A0D85A74;
	Wed,  2 Dec 2020 22:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoxp36NfXX2x; Wed,  2 Dec 2020 22:59:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B995585660;
	Wed,  2 Dec 2020 22:59:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5D06C163C;
	Wed,  2 Dec 2020 22:59:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EEA5C0FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 22:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6E3CA85657
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 22:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkk6Li-wLC1h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 22:59:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 06EA4855A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 22:59:10 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id z10so169052ilu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 14:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mseZ6HqpOaxIPoGJwt8mt2yChrOXFzD/3kFw06Juct4=;
 b=hfu1TJ5/FWuZCgIbvtJbzPxMZUMTTPpCYUSRixRQIbnINFXc+KpyD55xVuCveLb/td
 yej/IbMTjxZ/+aR2ZBJPoSU8Q8wtyCXRC+dBnJBZrqokm9Cqggv2UhGAdTaLRrKpLoCr
 MLWrXRhiiUthOFX06zAb50sRGusEmZ43pMd1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mseZ6HqpOaxIPoGJwt8mt2yChrOXFzD/3kFw06Juct4=;
 b=LbGsYk9sJ0Ah+VBFzJdW33fiCxYl3LmIRUVUjkmJ7TWYb3nr+62gKN+HsOrX3Crjl/
 0z2kVQ0fS5+Bu19kSpK4UTdd5nSuSVu42YcXRtXPGRCG31GAV5L3IASrRvTJqKcIvDOb
 uw82EuWvY63+iH8MvB9jHeH7cangDpkWsmDIwMmcUgUAIuDfyHwAq6/WQ69BPrSUY7I5
 XzGamU+c+SJBDfyvr/U5x9CpnVXo7zg6boIjmZHiykbdxyshAsFeLd50lyZjjgc2JGXh
 jI2rnREtJZmXW2zxuRZYRatVIkywKbCCjQi25ktgiNVeaahgCI2Fp0taAJujXqgUHEgs
 5lng==
X-Gm-Message-State: AOAM532nYLMZBbnoM6O6/ZQlF6rMSvvp24HDAe0ASEijM6TkSrE2w8+0
 10g82KLrE0rh4YVoR1YctOe8L9BO
X-Google-Smtp-Source: ABdhPJziJ8mfyelB2fg3kxZvhv+Eul+12x9D5wfaeHlaNRok6QkYABL8vvJerFHYvi2rxcNcHGQECQ==
X-Received: by 2002:a92:6410:: with SMTP id y16mr312945ilb.126.1606949949439; 
 Wed, 02 Dec 2020 14:59:09 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id n77sm98392iod.48.2020.12.02.14.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:59:08 -0800 (PST)
To: "Theodore Y. Ts'o" <tytso@mit.edu>, Arpitha Raghunandan <98.arpi@gmail.com>
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <20201116054150.211562-1-98.arpi@gmail.com> <20201202160742.GB390058@mit.edu>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <161a322e-e7a0-1b2b-d321-4f2871c31e0a@linuxfoundation.org>
Date: Wed, 2 Dec 2020 15:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201202160742.GB390058@mit.edu>
Content-Language: en-US
Cc: elver@google.com, linux-ext4@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Tim.Bird@sony.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, adilger.kernel@dilger.ca, davidgow@google.com,
 yzaikin@google.com, linux-kernel-mentees@lists.linuxfoundation.org,
 kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v9 2/2] fs: ext4: Modify
 inode-test.c to use KUnit parameterized testing feature
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

On 12/2/20 9:07 AM, Theodore Y. Ts'o wrote:
> On Mon, Nov 16, 2020 at 11:11:50AM +0530, Arpitha Raghunandan wrote:
>> Modify fs/ext4/inode-test.c to use the parameterized testing
>> feature of KUnit.
>>
>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>> Signed-off-by: Marco Elver <elver@google.com>
> 
> Acked-by: Theodore Ts'o <tytso@mit.edu>
> 

Thanks Ted.

-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

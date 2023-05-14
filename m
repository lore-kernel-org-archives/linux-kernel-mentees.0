Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35958C77B7D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 May 2023 10:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E85541EAA;
	Sun, 14 May 2023 10:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E85541EAA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WgvlRw8u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXplc1FF4XAz; Sun, 14 May 2023 10:09:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3819F41E18;
	Sun, 14 May 2023 10:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3819F41E18
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EBEEC0036;
	Sun, 14 May 2023 10:09:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E257C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC63082145
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC63082145
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WgvlRw8u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJiItPKV8Rpz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:08:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 150F3817A9
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 150F3817A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:08:58 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50a20bfe366so2851531a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 03:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684058936; x=1686650936;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ie9tiZWx0j0qso2N+/tHJUjGfMip0OumDCuv0l96kj8=;
 b=WgvlRw8uZZxNk/hWPkNXit0p+MkX0JNCyI7Vzy7yJY+OsvwTCNXVGUhs1wWVsvUX21
 nXH/U8P2buAlKk/QRUpPPlXwZ6xNSMN6Ie6c/P8o7+U+TpPiXqw9cHPQjufjQaP2oH5Z
 2ogGG7SzwoCreXK0QZcfN8Vr/5p2DNlO0+EVTN8Ri05js0mr8AoxvR+iELR9nMwsZ3eX
 0jkh0jQ8AObDYgvzUWBh6JBIamixp/DoIj7xEXrCplepepbHVOhrtVNq1s6jsaAgz15J
 6aPjtcKnlAQO8J9gHOrvTKum+grQaRuZiDsoQgJQpFsjgWYa2kNloSVD3NMmgFoodj29
 ZKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684058936; x=1686650936;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ie9tiZWx0j0qso2N+/tHJUjGfMip0OumDCuv0l96kj8=;
 b=i4EMdYRtJfALHT9mB0k7UwY4BTFHoCAyQwZZFrzM4WOmYUloYgcz+TiAFfek8zrSKE
 r4r5DxyRVZy5V6cHZRlazD3ZoWvSqZan056MilIdB9uc3AhNl2eUfao4qqvvY4qYyaMw
 AnfILvdl1fFaUWKWGB0HkNDrTNQDZ7LUKEo6uhkWhzbar5/+95V4caxfs1PaDrqaudfl
 1xTC5YrRDiwsighcsl3Sl9z19zTPXvZidtFmgEJIIOA+qvDANlvv67Xnk7tW4zLFEFZV
 vj35CxbcDlqbAbcO78i06lLw74C+kFn4MCSkLfbiyQluYfpN+wIY2Vvhow4rGruwUrht
 bhsA==
X-Gm-Message-State: AC+VfDy4sFCjmUnfmeu2DGjag+jhOeAQThgxeNijjKj3V32XVSWUacYZ
 wYoiMZ0adDVpV9Pw+Pj2PdM=
X-Google-Smtp-Source: ACHHUZ4Z1zF+di5vZ/CeRoQGRNuzAxlt2n8nf6jgaD78i3qq9gsh34Uq5xlThiik/oqT/cdFYmGmmg==
X-Received: by 2002:a05:6402:2742:b0:50d:9ba4:52dc with SMTP id
 z2-20020a056402274200b0050d9ba452dcmr4516415edd.0.1684058935703; 
 Sun, 14 May 2023 03:08:55 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
 by smtp.gmail.com with ESMTPSA id
 v17-20020aa7cd51000000b0050daa883545sm5679306edw.64.2023.05.14.03.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 03:08:55 -0700 (PDT)
Message-ID: <6f6d09b3-39e7-58b6-221f-6276d3ce213a@gmail.com>
Date: Sun, 14 May 2023 14:08:53 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] ALSA: Implement the new virtual driver
To: Takashi Iwai <tiwai@suse.de>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <20230513202037.158777-2-ivan.orlov0322@gmail.com>
 <878rdr8e5f.wl-tiwai@suse.de>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <878rdr8e5f.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 5/14/23 13:18, Takashi Iwai wrote:
> The idea is interesting, and it's a definitely good thing to have.
> 
> I wonder, though, whether it could be better provided as an extention
> to the existing snd-dummy driver.  The advantage of extending
> snd-dummy driver would be that it already supports different formats,
> etc.  OTOH, if we create an individual driver, the pro side is the
> simpleness of the code.
> 
> I'm inclined to go with a separate driver, but I'm open about this.
> Maybe Jaroslav and Mark have some opinions?
> 
> About this patch set: the driver name should be a bit more specific,
> as this isn't a generic virtual driver that is used for general
> purpose but it's only for testing.  And it's only for testing PCM.
> So, a name like snd-test-pcm would be more appropriate, IMO.
> 
> And, we want the coverage of different formats, channels, rates and
> accesses (interleaved vs non-interleaved).  How can we extend somehow
> more for that?
> 
> 
> thanks,
> 
> Takashi

Hello Takashi! Thank you for your reply. I fully agree with the naming 
issue, and I'll change it in the future versions of the patch set in 
case we choose to have it as a separate driver. I also prefer this 
option because in my opinion the use cases of these drivers are a little 
bit different. Also, I believe I can extend the driver to support 
different formats, channels and accesses in the near future.

Additionally, implementing these changes would be a perfect task for the 
end of the Linux Kernel Mentorship program I'm going through :) However, 
I'm open to other views on this, and I'm ready to move the functionality 
from my driver to the snd-dummy in case we prefer this option.

Thanks again for considering my changes!

Kind regards,
Ivan Orlov.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4492C7EE24
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 May 2023 10:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F6A41F9B;
	Sun, 14 May 2023 10:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F6A41F9B
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iz+yyxzR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yC946NAHC4g; Sun, 14 May 2023 10:12:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C42D241F6C;
	Sun, 14 May 2023 10:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C42D241F6C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94921C0036;
	Sun, 14 May 2023 10:12:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FA28C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16D0641CE0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16D0641CE0
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iz+yyxzR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZJeHJBvhxz1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:12:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2748E409AC
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2748E409AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 10:12:11 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50d8d4efd13so2034738a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684059130; x=1686651130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3yluCXcosZrevjCC2JlavkuAfksHzxF5e6l5bTTacBE=;
 b=iz+yyxzRQDLWnoppst1CEwUOmQtrnR+WlvFqDNxHCGjAIeYBxb6qPPyCwACmFvCMsC
 Uyay+Ka36Nybojkh+aNRCqbV3TtPsOyOys25ywg1hMUdPmR2syoQ798Rxs539vYqN85R
 dPEsGL6CYoLfnmNV3lfNftCjnKh5hBzTby0ZGcS3dlt90oaWJqGVnsvzZUmdOiBAhGcx
 cH0+uEO+9igr+IDSq85yTogMKAWP1Judjc/QeWoubOiltGwdbvQx+esnEgsuLyComVPu
 FRS19XpGr1KieeWX8+jraAcOzfBXfZh/EurqECNC853AdiNfIXOyuTn+Wm3pQXS2i+vK
 HOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684059130; x=1686651130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3yluCXcosZrevjCC2JlavkuAfksHzxF5e6l5bTTacBE=;
 b=MIOdQJO2oHXQvzQqjk0lTm6aHaeLFE5tPmayoamIBSj6L3e/hzKmR2AuBMxD0Cxf2K
 Kcnhw5BTFqtTOYGD2oDn+E0lZC1NJ/zqzb8Okfcv3vpmgWeuICWI8fbt3MKWiBk/p6sr
 foicGshpeXW1l3CzyNQllJ7cwqKzz+UwSln/jG1QgcaiMq4rkX79oRLlAztXYOt7lrN4
 CMNOra8+3uMb5b2Fhg/GPJG5RybFSTtW8VmvMmPHdm+MdUVJ9XTmsaMRLykr1fx39NZq
 fTUKaVsDMIz5YulOB+Gp3W8zfMtUl2J865kyjh1UCM91bYiyUowFzsBB0PjLiKfTFoHh
 3oSQ==
X-Gm-Message-State: AC+VfDxV1EMy9SQzCx1r3ak4ayKx1rKFCvmNZnLSXQF3VZbQD2z63lmu
 5ozgSRG+6OWCGcBVmURI5r8=
X-Google-Smtp-Source: ACHHUZ53jcFiyqFVZaWmZ6BG5QzdtkqPc0CsOZ7DLrne5HaLi/baHvYx5HM2X79dfK8omAPCsAoDUg==
X-Received: by 2002:a17:906:5185:b0:94e:d5d7:67eb with SMTP id
 y5-20020a170906518500b0094ed5d767ebmr22162527ejk.5.1684059129775; 
 Sun, 14 May 2023 03:12:09 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a056402185000b0050cc4461fc5sm5617797edy.92.2023.05.14.03.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 03:12:09 -0700 (PDT)
Message-ID: <1c4ab661-580c-caf5-f4c5-5a959b410ccb@gmail.com>
Date: Sun, 14 May 2023 14:12:07 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] docs: admin-guide: add valsa driver documentation
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <877ctb8e0p.wl-tiwai@suse.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <877ctb8e0p.wl-tiwai@suse.de>
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

On 5/14/23 13:21, Takashi Iwai wrote:
> We have already subdirectories for the sound stuff
> (Documentation/sound/*), and this should go to there, I suppose
> (unless there is somewhere dedicated for each selftest scenario).

Alright, I'll move the documentation to the sound subfolder. Thank you!

Kind regards,
Ivan Orlov.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

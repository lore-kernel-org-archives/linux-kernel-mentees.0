Return-Path: <SRS0=3GLs=F4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD23EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Dec 2020 15:20:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B20622288
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Dec 2020 15:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B20622288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F0200862FB;
	Thu, 24 Dec 2020 15:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yq1oeGbXVrpx; Thu, 24 Dec 2020 15:20:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F044862BE;
	Thu, 24 Dec 2020 15:20:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 600C8C1825;
	Thu, 24 Dec 2020 15:20:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99D67C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 15:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7FCF8862BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 15:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8Euf_w1ZnNw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 15:20:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6AC08862BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 15:20:02 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id w1so2508075pjc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Dec 2020 07:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ca4T5x2YBVwc3xGoJaMp1mpR1SgmL54F1JA2Sm/PSms=;
 b=UleZZf0Op+eYF5TErvSm7TLIikCFSdd1U+0OKwqHFteUOaOWRrU8KFt/A/5I+LCXex
 W32a3S96Zjt3NgC+f+7PhkdnaLGira988oA7Tybb7km20bd3qtFKGyb5Jdb73/Togh/F
 uInXoXfB7B5IfzairuKFTW3xhuZCz2BOvlI5tgcRBrfTcDiQBTHeyIzTAkXHSyD69uWL
 IK7q86HlpazS/qjfWbxcUnK3wzpRsOAFc/xAsOQgyWXUzfoq+gY0Dn8JOgKzwyZ40Qsd
 iPZ8+Y+1h+6AyzmjiWZlN57+GpAndcSpvw/OM/D4cUbIruMgrGwVFJLwUJSrNQtuZbJj
 vWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ca4T5x2YBVwc3xGoJaMp1mpR1SgmL54F1JA2Sm/PSms=;
 b=SsQqR0BJsDSDxAxMJLEkGH7QVu8WzKtOZ2uZdN430pDllrs6sXi4fidz1omWR9MnOD
 tIzXXoVsKBMZlO8R2GXxhFCD+KPcQfokzoOf/Z4ZDYR7myfA139wajWl6csUsZ33tpxa
 vd2z7BjvnbqSd0tGfHul4R1ufVQn+WA9hBJ8jHKDv+6W0tpdCcz6eOBm/MDeB6GZBgQ6
 N62QsSPeGruBHUQ6Cofh5TsAYfuw8JGp03rw60glXmk/Lyh52ugayIfk+L/A9wzQI/el
 UnVoZBK0H9BGszUkGTTRkiL2vxQLcJnW1TOuJP+9qoNqDLIgO8v5AXzBdDiZvcyBBZ/c
 /8Pg==
X-Gm-Message-State: AOAM530NDiIjDPbbHy49lx5ZtEUw7/KRaajYJwEbjYJ4ArBNNP+ouE8D
 SpsOXmMy1nzXnY/Angi1bes=
X-Google-Smtp-Source: ABdhPJzYus71jdfVs9Y87XtUOcQyYwfKsxleTZcccosnwQi+iCxJFWbHQ/6pnAJarom+3UlSBGsGig==
X-Received: by 2002:a17:90a:708b:: with SMTP id
 g11mr4715049pjk.23.1608823201803; 
 Thu, 24 Dec 2020 07:20:01 -0800 (PST)
Received: from ?IPv6:2402:3a80:40d:9f6c:f9de:b7a7:21af:4983?
 ([2402:3a80:40d:9f6c:f9de:b7a7:21af:4983])
 by smtp.gmail.com with ESMTPSA id q15sm15448974pgk.11.2020.12.24.07.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 07:20:01 -0800 (PST)
To: joe@perches.com
References: <1ce4502a-d75a-7e27-5844-f195607c4c99@gmail.com>
 <20201218121133.18614-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <84492ae9-7452-d296-49ab-4d37eed3b968@gmail.com>
Date: Thu, 24 Dec 2020 20:49:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218121133.18614-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false
 positive for COMMIT_LOG_LONG_LINE with URLs
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

On 18/12/20 5:41 pm, Aditya Srivastava wrote:
> Currently checkpatch warns for long line in commit messages even for
> URL lines.
> 
> An evaluation over v4.13..v5.8 showed that out of 11729 warnings for
> this class, around 299 are due to line starting with URL.
> 
> E.g., running checkpatch on commit 3cde818cd02b ("ASoC: topology:
> Consolidate how dtexts and dvalues are freed") reports this warning:
> 
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html
> 
> Avoid giving users warning for character limit for such cases, instead
> suggest them to prefix the URLs with "Link:"
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> changes in v2:
> - Fix coding style ('} else {')
> - Make the URL check follow RFC 3986 style
> - Give warning only if the URL is first non-whitespace of the line
> - Set $commit_log_long_line only for else case
> - Fix the warning count with exact figures and according to first non-space char as URL
> 
>  scripts/checkpatch.pl | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index abd5a3d2e913..bf77bd0b22cf 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3032,9 +3032,14 @@ sub process {
>  		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
>  					# A Fixes: or Link: line or signature tag line
>  		      $commit_log_possible_stack_dump)) {
> -			WARN("COMMIT_LOG_LONG_LINE",
> -			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> -			$commit_log_long_line = 1;
> +			if ($line =~ /^\s*\b[a-z][\w\.\+\-]*:\/\/\S+/i) {
> +				WARN("COMMIT_LOG_LONG_LINE",
> +				     "Consider prefixing the URL with 'Link:'\n" . $herecurr);
> +			} else {
> +				WARN("COMMIT_LOG_LONG_LINE",
> +				     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> +				$commit_log_long_line = 1;
> +			}
>  		}
>  
>  # Reset possible stack dump if a blank line is found
> 

Hi Joe
You probably missed this patch. Please review :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

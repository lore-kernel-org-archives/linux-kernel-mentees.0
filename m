Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB1EC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 12:11:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 069AF21D40
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 12:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj89cR4g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 069AF21D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7786F86CF3;
	Tue,  3 Nov 2020 12:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eroMaQPCUoRZ; Tue,  3 Nov 2020 12:11:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 465DB86C8B;
	Tue,  3 Nov 2020 12:11:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39762C088B;
	Tue,  3 Nov 2020 12:11:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 115BBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 12:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F002285F8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 12:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7EK1BPIKCct
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 12:11:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 725DE85E08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 12:11:51 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id w65so14035585pfd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 04:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=0jZqlGIJPFeiIIz84g3Sogc4z1E7uwMUHyI0ijMosxk=;
 b=Hj89cR4glZjBkDrxsuCKj7tQ6MviPyD8xSVX6bB0MLZ0YvS/t0vDMER5fBc60Lzjod
 ycgOQkwOgOTY2MxE79p9o+LSaEje6extZ7Y9yrp0NPAITFNoEp1Lfo6QIoRGuOodWD1g
 wROlGzojzHX0siq18mjx33oPmXDtaKVvD8oPYowJy+sSkvZ/JonHQhfDqF9+ZIui4MiU
 jWpHdMOpsmlCUj2Kwxxaqe4BeOoElAm2dgYnAp6FSESBMDOPLSM86q7Wy5RF7htHLkij
 SKhlt6nq8ocfbcX/ki4jMKPrPWxMdMWgIhxnnojxNZdBDe5Y3XOK/UdwAZ3DnhOcrNXH
 O4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=0jZqlGIJPFeiIIz84g3Sogc4z1E7uwMUHyI0ijMosxk=;
 b=IrRpb63m3KHyPKRLqJO4vGsjQHt+jB/fskDveRhGmacrq1id1l1CpK0u+H9u7zbkyY
 4wBPPJVki3VCAhXHT9XUoGNFz8rcB0YTK+5I0/AxA+plsNYHIm6RJHk7L+dvanKGTd4U
 +9BicM1GiMfSWtF8MDFiI8YcsdLSBn7XGIgc2et+3yK6Q5waWjEaCZwZgQPws8qZ4tCy
 ucept+hjxJfa16d3v4bmA01AQCFPDs+flmP8I0T3MOZz/fHN4FTjqipDMQ7Pbytci+HC
 N48mlqq/hSKc0x/9avQvgrOo/oAwb/bm6R1iu3yA+7Zzv6z5545m9BJSmMaH9Yn3+YGW
 wxGA==
X-Gm-Message-State: AOAM53079Z4ukTEZ8FeS+7snDEv16Z6K3PicVCOIioNx84P7qKlTKHok
 JNRoGqCu3qimNU1Oi3TbOd52JwDpXOF2Og==
X-Google-Smtp-Source: ABdhPJx3DZObYwwpvQPOgVQ4FCaUlkTa7M9TztC7ONUDuWtCSUL78dXUTsQNl3FGqZcd6BcwK5Ovow==
X-Received: by 2002:a63:5c5e:: with SMTP id n30mr16776422pgm.54.1604405510539; 
 Tue, 03 Nov 2020 04:11:50 -0800 (PST)
Received: from ?IPv6:2402:3a80:41d:f163:ac:13ab:8c6a:34ab?
 ([2402:3a80:41d:f163:ac:13ab:8c6a:34ab])
 by smtp.gmail.com with ESMTPSA id a28sm1615350pfk.50.2020.11.03.04.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 04:11:50 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <4b8da06a-5162-28da-d4d8-91feaa172231@gmail.com>
Date: Tue, 3 Nov 2020 17:41:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] checkpatch: add fixes for BAD_SIGN_OFF
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

On 3/11/20 4:11 pm, Lukas Bulwahn wrote:

>> 1) WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to
>> attribute nominal patch author '"Zhang, Jun" <jun.zhang@intel.com>'
>>
>
> I think the fix here might be to drop the Co-developed-by: line,
> right?
> Can you confirm this fix on your evaluation?
>

Yes, we will drop the Co-developed-by line for the author. As he has
already signed off for the patch, co-developed doesn't make sense.

>> 2) WARNING:BAD_SIGN_OFF: email address '"Matthew Wilcox (Oracle)"
>> <willy@infradead.org>' might be better as 'Matthew Wilcox (Oracle)
>> <willy@infradead.org>'
>>
>
> I think Dwaipayan and Joe are discussing the proper handling of
> quotes. I suggest to understand the resolution that Dwaipayan and
> Joe
> are working out before thinking about a fix for this option. They
> might decide that only a few specific cases should be warned about
> or not at all in case of quote mismatches.
>

Alright, I'll omit this one for now.

>> 3) WARNING:BAD_SIGN_OFF: Duplicate signature
>> etc.
>>
>
> I do not see the fix option for this case 3; the duplicate signatures
> are mostly due to the integration Signed-off-by trail.
>

Sir, mostly the duplicate signatures are occurring when the user signs
off 2 or more times for the same role. For eg,

For the commit 6dd47d9754ff ("mac80211: fix
ieee80211_txq_setup_flows() failure path"), we get

WARNING:BAD_SIGN_OFF: Duplicate signature
#16:
Signed-off-by: Johannes Berg <johannes.berg@intel.com>

as the user has used 'Signed-off-by' line 2 times. The fix for this
can be to remove the repeated line, similar to co-developed-by one
we're doing for the (1) case.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

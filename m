Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD211CDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Oct 2023 07:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7255D60FD1;
	Mon, 23 Oct 2023 07:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7255D60FD1
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ualJUOCj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24dLpO3714jp; Mon, 23 Oct 2023 07:12:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 71C0560FC6;
	Mon, 23 Oct 2023 07:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C0560FC6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CB2DC0039;
	Mon, 23 Oct 2023 07:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73D91C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 07:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BF2840986
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 07:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BF2840986
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com
 header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ualJUOCj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMHj7cYiJYsO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 07:12:24 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6E9140976
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 07:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6E9140976
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so434352466b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1698045141; x=1698649941;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tDpgNYJBZWfpDGAZyLDDwSjicDHKCRY45Gtgt4Snt7Y=;
 b=ualJUOCjIIEuARG9xTlnSOZMtyGrhvsjxnnV1j/cMGLa249+SFMq+PJJ70+XaB18Hk
 717FIlAQe6sbmqLsUr3wWU4QAs0rh4kK2et8CIapJjr69b/CcEItE38q3DunrIPAMOqU
 rT5FSWtR36410a4DWmYhC66kqIVan6mCPtSi5Vqh/oIMxxbJ7PZCtHPYj40A6nl5Mv1n
 9jZeMn5Qe7jJehk5C6YfvUcaRju8IiP0utUO+TltUc8D+ed8kqGSIOWpJRVFEeCEzbnM
 8ABpwocaunqsGRAwwYm8Tei53EDI1Eq3UuzuGgW5Jnz3tw+wcRyCl5Dz7XEVjRL6LG6S
 YXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698045141; x=1698649941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDpgNYJBZWfpDGAZyLDDwSjicDHKCRY45Gtgt4Snt7Y=;
 b=R8qORZD/uWCqrYA5FKhGqau2MCZYg1Mtuygk5wEVneruhhT60SoK5R4MjcPS00RvBL
 q6oMkF+oVcAB9XOUFcHbW5LCZ0S2X1tS4syjY4MD04buY8YpNQbUTlS6qB7/p3xde9Rk
 ZQyZW07LzwG49bePZLkgiu0a6P9j5Czlgk7s8PHTgyCp1xx6PoW41xdPONF+JqZPeTGa
 usDbDWkrWKEaOoNQr/4gkIHAhYSpy4NQ8fbacvkB4wRvVAWFRn+T9YoOhmXIT1zwxw5w
 X8wpuEmiCcgSLLYHXXjFDE0Xd4D3ctyRK5Viwv8rp+M7rmrT1TkxKIJ76Be6yf7TtFQh
 OBog==
X-Gm-Message-State: AOJu0YwrIDY2xQVztnCAt8V2eswPwFnkQcECBqqdITl2LACxNIjPInoB
 My9x+eudoOa5V0R8fb6NJw4OHw==
X-Google-Smtp-Source: AGHT+IFNEqdPmZMghAIy7qjWE2pPnFeO4o0LaZi8rPbo2VteX3nMu1nl4MGz2o+B+svnGR5EbZ9hJw==
X-Received: by 2002:a17:907:86a6:b0:9bf:388e:8e93 with SMTP id
 qa38-20020a17090786a600b009bf388e8e93mr7195167ejc.0.1698045141185; 
 Mon, 23 Oct 2023 00:12:21 -0700 (PDT)
Received: from localhost ([86.61.181.4]) by smtp.gmail.com with ESMTPSA id
 16-20020a170906225000b0098921e1b064sm6158861ejr.181.2023.10.23.00.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 00:12:20 -0700 (PDT)
Date: Mon, 23 Oct 2023 09:12:19 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: David Ahern <dsahern@kernel.org>
Subject: Re: [PATCH] selftests:net change ifconfig with ip command
Message-ID: <ZTYc04N9VK7EarHY@nanopsycho>
References: <20231022113148.2682-1-swarupkotikalapudi@gmail.com>
 <fde654ce-e4b6-449c-94a9-eeaad1eed6b7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fde654ce-e4b6-449c-94a9-eeaad1eed6b7@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-kselftest@vger.kernel.org, kuba@kernel.org,
 Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>, pabeni@redhat.com,
 shuah@kernel.org, davem@davemloft.net,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Sun, Oct 22, 2023 at 07:50:52PM CEST, dsahern@kernel.org wrote:
>On 10/22/23 5:31 AM, Swarup Laxman Kotiaklapudi wrote:
>> diff --git a/tools/testing/selftests/net/route_localnet.sh b/tools/testing/selftests/net/route_localnet.sh
>> index 116bfeab72fa..3ab9beb4462c 100755
>> --- a/tools/testing/selftests/net/route_localnet.sh
>> +++ b/tools/testing/selftests/net/route_localnet.sh
>> @@ -18,8 +18,10 @@ setup() {
>>      ip route del 127.0.0.0/8 dev lo table local
>>      ip netns exec "${PEER_NS}" ip route del 127.0.0.0/8 dev lo table local
>>  
>> -    ifconfig veth0 127.25.3.4/24 up
>> -    ip netns exec "${PEER_NS}" ifconfig veth1 127.25.3.14/24 up
>> +    ip a add 127.25.3.4/24 dev veth0
>
>ip addr add ...

Why not "address" then? :)
What's wrong with "a"?


>
>> +    ip link set dev veth0 up
>> +    ip netns exec "${PEER_NS}" ip a add 127.25.3.14/24 dev veth1
>
>ip addr add ...
>
>> +    ip netns exec "${PEER_NS}" ip link set dev veth1 up
>>  
>>      ip route flush cache
>>      ip netns exec "${PEER_NS}" ip route flush cache
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

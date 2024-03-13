Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BC113AD9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Mar 2024 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710313634; cv=none; b=prkahuGe61Nb+EpAcDS30iJ29uapZ0xIawtec6N/DLsFBTRmN6dYbGwKD9sLw0ZOIp7SUd6dmdv93WaHydmOqfWRaeIl1bdiKKNG69ZmY8Rxd8slSMHpvY3l+dy6R7LmGAGdYl8+kjQrnYw5AizFxc1FSjtamja3qqBnS0cOJzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710313634; c=relaxed/simple;
	bh=JQJilIKYn5hksiLBV3Gi0KoS0fQs+2OijTyw0AP/xcU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=oVGSY8yRJj6cxcKp8MGx4cb24VY3s7d4SZ1YOmP1lklJz2Nv1NJRX8goo7tB9YYzJ4VBNbd0LEBa+uecVJZKYIv3AfFzrWyFHxQrrngT7OUNTccuIBE5lcEdyhvjz6A+iSu6ZeBf0OCUyppW1RqAkK3yNYP2a5DX0YjrfVeTMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7qOw8Bb; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7qOw8Bb"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B14681587
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Mar 2024 07:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlzioXtqYfKE
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 13 Mar 2024 07:07:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=kohshi54.yam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E250E814AB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E250E814AB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G7qOw8Bb
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E250E814AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Mar 2024 07:07:12 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso980203b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Mar 2024 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710313632; x=1710918432; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQJilIKYn5hksiLBV3Gi0KoS0fQs+2OijTyw0AP/xcU=;
        b=G7qOw8Bb6motrv7SXN0SIHJxJGO8q+zq9jg6TgBp5XHlT7d1/5rH+Jjp2A7L1Enqbo
         oDRfAYLntrG0JlH36pN240YGeguJqoiPe5oAGDUa5muE/r1Iy6lrkIjh06StSaAZvGCa
         cP/BU8gUnh7t+z1PWxm2OkZsoFthmAYtWJBg9A8pekr1wmrDX5PIBmnZ0NaEuB2Fbbp7
         BD6Jq23X5WA+p3jR7TuM2EhFbpmgjj888b/yFucDKzHXpJ/rcd3AHDKqUqMwFjwl3XwJ
         OSRreMFk2ODPHHdVnCZo2AqgWQevLyJzPglnBSiFMlAzHxlEVpRAAxo5k7NnIOZfMNOs
         AFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710313632; x=1710918432;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JQJilIKYn5hksiLBV3Gi0KoS0fQs+2OijTyw0AP/xcU=;
        b=RylNO9zi5JyrlGE5G6b8lCzAIrCOYmUCc79lJG9sRbNLQ3C6+eELfEEVGbEBFxmkrq
         VVwvIJ2YhMBG6krnm2ev1w7WjAX6gOCWketq7zzON2stR4rfHVIYvv/Dnhyr2Pn1klAc
         RxrjV8R/ytY+J1OgEZ13THGJVDHG6K1FB0ygF6dHuhCIgqhcKOZPUw+jiC+Xx01WMPAl
         v3ejjT+B8Bl3tIN91IFx6lZuwRCBiU+zCg3fnVVsWruOOPtlM53u4n1GItit60t8ecNZ
         JpqznKxEksJGOjVLegoRSCxDv6DxZUJu/rCMOfdEtdBNa5XIBf95L3EL87ZFVueqFUuq
         6hRQ==
X-Gm-Message-State: AOJu0YzyzQxI2+FdgXsyDvaaz2LbYnakVfB+kFjiuVJ78l/on2yzl29o
	ruj6B8faUZzUN3kRdxIF52c5o3Hlx2COy7H5FbifcIutwR9ZU+BOXvPqWDR2
X-Google-Smtp-Source: AGHT+IFxMH8UDTuMCPQ7R1EbnafVJ0m8J9w0WhSdyTmqMMGoI9XbudZcl++RwtsWlGMK27cmBE5rLw==
X-Received: by 2002:a05:6a00:8b86:b0:6e6:bfd3:fbd8 with SMTP id ig6-20020a056a008b8600b006e6bfd3fbd8mr137968pfb.3.1710313631717;
        Wed, 13 Mar 2024 00:07:11 -0700 (PDT)
Received: from [192.168.1.21] (220-158-101-48.bkipp.fdn.vectant.ne.jp. [220.158.101.48])
        by smtp.gmail.com with ESMTPSA id i13-20020a056a00004d00b006e50c083b90sm7168975pfk.212.2024.03.13.00.07.10
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 00:07:11 -0700 (PDT)
Message-ID: <abe5d265-e26a-4c13-b54f-429f3b845dbd@gmail.com>
Date: Wed, 13 Mar 2024 16:07:09 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel-mentees@lists.linuxfoundation.org
Content-Language: en-US
From: Kohshi Yamaguchi <kohshi54.yam@gmail.com>
Subject: subscribe request to linux-kernel-mentees
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

subscribe request to linux-kernel-mentees

Thanks,

Kohshi Yamaguchi


Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6B6519F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UONdY3xD"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C4660BF8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 19:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C4660BF8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UONdY3xD
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2DLig0sr42Z
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 21 Dec 2023 19:08:26 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 34A6460DB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 19:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34A6460DB7
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d3536cd414so9522805ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 11:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703185705; x=1703790505; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76+oyG2G1x0gT7TSaAnna8obnYpV1SthTcTntxCagtY=;
        b=UONdY3xDwnACUgsfQ1hhswAC/RCUfOjQ+PFKOqMfNrh+WAbQYEvc8m+QHCiuqUirdZ
         4vD8ljZlGQEmEIpININRhOEwyevuumUU2406zCOR5d7gCwAvZ+exmIQnQ7p9EuL/Vt+J
         06fLcSPVHYQLgCLHGJk4Ogmdb6DQayaIagMkhu6zahRcKK/hdkx/W07E42j8aHMYCYJy
         xVi1BlN4Kg2Gj94J024v58qtX2MDyHzBeq1qBcGXlzl5wM/rdHcADw+oQs9Wk86GtJjJ
         xp8y3VA6K0FABXjMajbsya+nDFetxrr14c1d6qjnqhUI/GjUIKZQioywG5J9GdKLFZBw
         pEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185705; x=1703790505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76+oyG2G1x0gT7TSaAnna8obnYpV1SthTcTntxCagtY=;
        b=nNKLitG3bwY16gHhJcKkyZYunCApWSGti4d9ME8N/nA+nd7Yn2zs3ztYOYtigakLWI
         F1290QCxVHNkcWRHJrgzHsooUdgVPgKs++ui6FKVwesXkwBD14ots/NAh57H8iLAOk/y
         3QH5UvsY98Yb1zvv2SZMh7Az7lalhY7nFaWpy8OMsCc+xJdcLS/Ezu3FspeftXfXy0nl
         WjxRdGgyF+7bDYa4j1CrPF8w4WNSghfHADNpKSlXndF3+nrKPxHLeEgLROCyHievwHr2
         s3E0gIOTKcvqBBVEdG0WsNIICV+r5/udiCZl2V3owslFl7ZcMXjsgVHK04UjhMnTrIUm
         anNQ==
X-Gm-Message-State: AOJu0YxbYrnELbZi6z+RNBt0MpPQnTuOx6HcIn30IfstUkV1t6+AlGJa
	x4xVB0C2ce8AOq/7nsstQG8=
X-Google-Smtp-Source: AGHT+IF4zGZPazNZTfZ5miRc6/PEO7loJCDDGRSV2wmSChdY5PEy1bwjCkDj2S68lM164f2lBqSy0g==
X-Received: by 2002:a17:902:e843:b0:1d3:eddf:6769 with SMTP id t3-20020a170902e84300b001d3eddf6769mr128289plg.92.1703185705576;
        Thu, 21 Dec 2023 11:08:25 -0800 (PST)
Received: from ?IPV6:2401:4900:5f1b:292f:dc7e:1579:ed7c:8f49? ([2401:4900:5f1b:292f:dc7e:1579:ed7c:8f49])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090282cb00b001d398889d4dsm1975467plz.127.2023.12.21.11.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 11:08:25 -0800 (PST)
Message-ID: <1f84c8f4-0b21-4e6e-942c-1f987dd5f63e@gmail.com>
Date: Fri, 22 Dec 2023 00:36:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: input: convert drv266x to json-schema
Content-Language: en-US
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231221181423.671432-1-anshulusr@gmail.com>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <20231221181423.671432-1-anshulusr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I mistakenly submitted this patch to the iio subsystem and CC'd the no
longer valid e-mail of Dan Murphy.

Kindly refer to the patch below for further discussions:

https://lore.kernel.org/lkml/20231221183109.684325-1-anshulusr@gmail.com/

Apologies for any inconvenience,
Anshul

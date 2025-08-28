Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C9211491
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756409167; cv=none; b=mSuf6pHDpod3aOgO1n+RrR+QnzR/abss8F9mO/aCp/B4I2neHKrCGU2MqHfK1HyHufMoUWHMd+VsUTP8KsKSGJPuOIk/NnYI4cVfV/cPjrfLO8S0eC7iy6EQrI6MAuyZbfzoYSQg7EyyzJEIoTRk0Y5izmPBiQ4MY0uucoUp9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756409167; c=relaxed/simple;
	bh=iQDHls7dhKgBkVim32KIx+Gbn9Zo9HUnX/e0BW/lc0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=keGKdYuphPDuHAyt6h3obD14AHCrgfPdo+6LYLBiIAZQn/F0q/rBmfwqCgk/k2A8eh1JxQWwGP4csRN6jwP2cbvSnS3lO5KiiBO6OzX5/zlm0mUvb/51TQgkDFaXOaynoTgE8mYI9fw2MgLXqtfmErkgxqtP8GPi4J6PfGJ0+R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPkKpq3X; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPkKpq3X"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D778982317
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 19:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JY3ShxYzCzEP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Aug 2025 19:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 461B2822C6
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 461B2822C6
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kPkKpq3X
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 461B2822C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 19:26:05 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-771f4374fc0so66901b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756409164; x=1757013964; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNKCiEXVNimfghYWuXUmKnsDjiRGghYXpeYN/YwzGig=;
        b=kPkKpq3Xy2CjeZE4EQKxF446KZrQedr+By5Z1iIy4lyXgmVvjVddNnrYcF0I5tLFK4
         LBDqMtXFdy/85UlCGJyCVdio45mHLaJMOPiFvjefqNtchDmLEp1ik7eDP+2HPRf8Pd2Z
         5coHeWc1HyRVTDgBmGPPLosa5pLE01QH8epdDCXV016Ij0BTEJORqJS/BK1IfdhcsVGV
         rnodITGt+6L1iat+NauzmIPDgUZRHritS2PrL0Ltkx0GALKS9sOWgERd8Zhhulp2owuM
         VQs6HrDyP0oQhGDqWMVQoRvjfiEBRdT1OLHNwq4e0Y6uoWC1QYPQ3Hl3QYNz2whkigKn
         EKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756409164; x=1757013964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNKCiEXVNimfghYWuXUmKnsDjiRGghYXpeYN/YwzGig=;
        b=rK6pdPEKA4R3eFqAKEFGJdSopa0r1ArfKM5mU1ipEjAcvgYwtpOaD28j+UY7lKCVUK
         MaheSbQVefozl8MWmcmNMI+WT1xLW5Axsl4fTPY09Y5FwfxHUDbJm9fdL0WYmN3qHcwy
         Eh5B9UU2MfmOt3AUHmPWjqNE11O/yze+id1vqVVsMNKrIXXoW+yMZBTxhNBiAZzxTWFT
         219LRrbD07W8L8h8HQlm8h1MjIJ0Rtq80dr7LYW4RJuO8ytOFdBkLDnV3jNRrNKwt4pV
         a37WdFA0NxGuI8oKYxcOm+LNeDOQ1V8t3zqywbM0OblWaXIgl85/jqkiAUBq/6OTORT9
         m7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG46ENpQ+FOtRmy74yuwOig0KrhF4VgMlMw9CsZaENKQzTMDrnWlEJ/nrbOW2IqBAkfFcQi2MD748WKP0c0KkL34movg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyfs/nVApnz/XTlUAaOW6Y58nzESShC2XpEOuwIjpJZeBGy/QPX
	sVirQUXD1qop1jCs5EycgVLn6N78VRuctFPJjOgApKKztN9j72IbbxNN
X-Gm-Gg: ASbGnctqWk0T4USn5JZVQ6/nzdvStBaMDBIbIaKY1wPNtil7sY98QMtlWEAuEtp1lw8
	iY0YKqG3Sti8en3QzYyB4oqdJg/4WkzNauhKfzi1zD9wlIEdmyo+4UIy3+AO5swlx2YIexozqX9
	QPQKP8/+brDSP+QWep2MArBqjKWzcp6GZ359nnN3CDJk1kiSAFEWs547rLG7IKKVgbKSU90qmTT
	i/YF8Vc20dPewgPxAMLb/on5xBR76fGG90LvC1q7HXbRqv5nlCp95lLkuuDloHZDNq4AV0PHuWg
	lSjAlq2pUufk5JK+VdbM9x4pIkNADLE25Ha9M1qiEJE6oHCI0HSK/257oJVVSoVuopteKbYbJ61
	8i+dlM8pk9TKs/66kFe0JYg7ipgDoLA==
X-Google-Smtp-Source: AGHT+IGcyabkfIuSoXCOILkTR8xN93+W1H/AO1TgmOhp+v3ddQPFBzXanNv611WeYtUQcZLAXv1+Hw==
X-Received: by 2002:a05:6a20:729f:b0:23d:da6d:b050 with SMTP id adf61e73a8af0-24340dc88e9mr18828886637.6.1756409164421;
        Thu, 28 Aug 2025 12:26:04 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:c01d:44cd:e101:4619:945f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2aafa2sm221784b3a.22.2025.08.28.12.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 12:26:03 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: vadim.fedorenko@linux.dev
Cc: andrew+netdev@lunn.ch,
	anthony.l.nguyen@intel.com,
	davem@davemloft.net,
	edumazet@google.com,
	intel-wired-lan@lists.osuosl.org,
	kuba@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	przemyslaw.kitszel@intel.com,
	skhan@linuxfoundation.org,
	vnranganath.20@gmail.com,
	aleksandr.loktionov@intel.com
Subject: Re: [PATCH] net: igb: expose rx_dropped via ethtool -S
Date: Fri, 29 Aug 2025 00:55:51 +0530
Message-ID: <20250828192551.13216-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <29cbde11-b7bc-4eba-a0ea-b20e4a9ecb79@linux.dev>
References: <29cbde11-b7bc-4eba-a0ea-b20e4a9ecb79@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> On 28/08/2025 12:42, Ranganath V N wrote:
>> Currently the igb driver does not reports RX dropped
>> packets in the ethtool -S statistics output, even though
>> this information is already available in struct
>> rtnl_link_stats64.
>> 
>> This patch adds rx_dropped, so users can monitor dropped
>> packet counts directly with ethtool.
>> 
>> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
>> ---
>>   drivers/net/ethernet/intel/igb/igb_ethtool.c | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/net/ethernet/intel/igb/igb_ethtool.c b/drivers/net/ethernet/intel/igb/igb_ethtool.c
>> index 92ef33459aec..3c6289e80ba0 100644
>> --- a/drivers/net/ethernet/intel/igb/igb_ethtool.c
>> +++ b/drivers/net/ethernet/intel/igb/igb_ethtool.c
>> @@ -81,6 +81,7 @@ static const struct igb_stats igb_gstrings_stats[] = {
>>   }
>>   static const struct igb_stats igb_gstrings_net_stats[] = {
>>   	IGB_NETDEV_STAT(rx_errors),
>> +	IGB_NETDEV_STAT(rx_dropped),
>>   	IGB_NETDEV_STAT(tx_errors),
>>   	IGB_NETDEV_STAT(tx_dropped),
>>   	IGB_NETDEV_STAT(rx_length_errors),

> This stat is never used in the igb driver, what's the benefit of
> constant 0 value in the output?

Hi,
I initially proposed exposing it, but after reviewing 
the driver, I realized that stats.rx_dropped is never 
updated in igb. Exposing it would always show 0.

Ixgbe behaves the same: the counter is present 
but never incremented.But this patch wouldn't provide meaningful data.

Thanks again for your guidance.

Ranganath

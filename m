Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3652EA15D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794109; cv=none; b=cRBD4OBY6hbdQ4YClLu/5Ogv4668LqImeJFx4sgBSmKzROfJpSNb9KefCvO7kgET5sDYdxvBVpt7JVAPR1oTrpSZCyCsXiMLfYJ6uJ8Hk4rPrObBj1CMvirZllUcxforc98DkfnJWDwkWpX2DVtUzXfaZBK3VTd9d67cYo+/Tvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794109; c=relaxed/simple;
	bh=gYz7iV05DSw4pVhAWjhV3Q0zzhj5V+j80F263wxEhK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAczZeSWQG5Kag5muhGSX647avRoNBOIDyWKdK1mie9/h89eBLT5YwIbz+MhM1WrB6E7p/d7J70ObcqR5pu4/w84RZLpyumMREfRvX7CfXC33+NmIlcV2obDoluTcZlN42APCX23yZXH2iomBH3/hmmqTqe9/apKmudUrwKOnw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQJMXB2k; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQJMXB2k"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4DA80FDD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtDtJaOdDGlF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 09:55:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FECB80F7E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FECB80F7E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EQJMXB2k
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5FECB80F7E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:55:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6344f12acb6so85310a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 02:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758794103; x=1759398903; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6dvovCLm5rvYDjRuqlZ0v6O+tZDtYwybR22eRO2w/w=;
        b=EQJMXB2kAz5JVlQp+Lz1adShCisrE4/mPg4WE9PEuZFupdZ/mag/XUKxAXZluvZNSj
         /DujsrWxwh2cBTQuaXY4pEsaF8mnrl9VXM9uSNDU2fxUh+rbRk0it2IVd2P0eiKDQcf4
         grBnHDNfrFQB9uiOxiVzE8m9RPx+E1zDAWeJkzXazih+0NW2ZF4Imo2K7mnmWz/OsnnV
         htU79kL3c7qP+9eQdX7y8+3+9wBfzDKHh+HpOG6FQ/dE/BfWUZ4I5BzWRYPyZKsnFebL
         zt1KAX6F4g/NRtGEKOhvAzXK4RK9/kFNT1Twzx4n6uY0R2Ks/j8YskyS6XpO5fqtG1+e
         NSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794103; x=1759398903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6dvovCLm5rvYDjRuqlZ0v6O+tZDtYwybR22eRO2w/w=;
        b=pqZhXZnBM0EFUp2rE5Cch0UIMWsk0UPRr5L/3mRhXo5x1ZT4bX6mebZ5rnUQyq8wSA
         XEc4l3ejdI8iCSXGHUG6qKaZIGulxEkR/77lEN477hihkuwGP4dv8Ct6uk9vJ0wxUZO2
         ebGL+FNyK7eW0sFe9mya3pLnWwiugz9i371saHOmHj/cW2B0DOtbaByA40UGmRLTHJtI
         YzH+OU1GNrdXHv2uYcI/HY8cipKcVWJfoo4iqrwgDYXRxdTAmb4Bm/EBZfoYPWOQvDsT
         O0EMwd8tgMMtiFmdrQvoRgW8BV7KbkMyXw+3ZGo5PR5nJhkGvf4oR1Nw7io2Oys7oMJz
         iFeg==
X-Forwarded-Encrypted: i=1; AJvYcCX67fHZUxFtJLgk+ANxMrA2KJyGaoBUp/3guYWz2K29AajWBCfRiGRMzqqvo6e/jnSykNjfqUrrTIaKFyn1N/uFMS/x0A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxFMLfwNUG3mhTj3cve6m347iequZJb2lyger889XYHK5N5EkQa
	guYCHBkhgk+CTs17shGkEQF6VDXGt4JhTH2nkXRCSzaH+iGFuTUBwGQF
X-Gm-Gg: ASbGncvzdT3AuBLQqgjCMYxAV60Sntpp4dJEkeZMNrDt6D8zO0uvYpPZXoxjd5MKJH6
	/GyeVOvwWDa+wyzbkTssE/nZp7lwECpvpIzfhh1VXAZ6luiGs2C0IxT8anDnt+Cl/0gSCHTO7dx
	4mwiz17057eC8ncQSygxjtOfL+tU5y4QdItAoBelexZ45iLoUEAZ7aUeNfi/Px1LYU3y97akjQR
	gu+D928Z1iIrD8r5Ot+oOMCdJlXWPHyr7nQWSN2u1DvVbjpNe0pwx/au0J0TkjBUqz9831jV6Sw
	AAuOTaVbCyVXigP+/lpxvlHf3iSmpjR4LlgA89VghdRE7yXxH8dTeF2/Ue/fPrcbUE26/AoogV1
	pUYdZA2b/GdUXU3/Pnw83D1Iveuw76/bzRMMsb7wWHB4=
X-Google-Smtp-Source: AGHT+IFTuGy+/aqTWUBxQswnc2Pa/G9YhWnP1H9BAmagYPQwBxO49Up+XtOmxAKd1meYws/OfWOHBA==
X-Received: by 2002:a05:6402:239a:b0:634:9e76:9997 with SMTP id 4fb4d7f45d1cf-6349faa4975mr860990a12.7.1758794103190;
        Thu, 25 Sep 2025 02:55:03 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.112.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae31cfsm919842a12.33.2025.09.25.02.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:55:02 -0700 (PDT)
Message-ID: <0cddb596-a70b-48d4-9d8e-c6cb76abd9d2@gmail.com>
Date: Thu, 25 Sep 2025 11:54:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, donald.hunter@gmail.com, andrew+netdev@lunn.ch,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, matttbe@kernel.org, chuck.lever@oracle.com,
 jdamato@fastly.com, skhawaja@google.com, dw@davidwei.uk,
 mkarsten@uwaterloo.ca, yoong.siang.song@intel.com,
 david.hunter.linux@gmail.com, skhan@linuxfoundation.org, horms@kernel.org,
 sdf@fomichev.me, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
 <87h5wq50l0.fsf@cloudflare.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <87h5wq50l0.fsf@cloudflare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 10:43 AM, Jakub Sitnicki wrote:
> On Tue, Sep 23, 2025 at 10:00 PM +01, Mehdi Ben Hadj Khelifa wrote:
>>   This patch series is intended to make a base for setting
>>   queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>>   the right index. Although that part I still didn't figure
>>   out yet,I m searching for my guidance to do that as well
>>   as for the correctness of the patches in this series.
> 
> What is the use case/movtivation behind this work?

The goal of the work is to have xdp programs have the correct packet RX 
queue index after being redirected through cpumap because currently the 
queue_index gets unset or more accurately set to 0 as a default in 
xdp_rxq_info. This is my current understanding.I still have to know how 
I can propogate that HW hint from the NICs to the function where I need it.

Regards,
Mehdi

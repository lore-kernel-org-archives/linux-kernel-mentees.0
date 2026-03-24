Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2360740DFA7
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Mar 2026 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360564; cv=none; b=K6y4BCbSxQV6oavG8ua01/9IxtZ4vwwi69i6pgPubW8DFq+XLS7rUuSQyjqWirNLZdKD9oKrdqIoY9jdmeqrotuXootYFqqsszOvMfQfBASYcI7MpHNxCMY0wMLKHV6tFxgCLw5AdqWaHbRnWJ6dPCBMdHsSEy+sD+GBcQMII1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360564; c=relaxed/simple;
	bh=4a7RiEXSFl58aUqN2pNP8plhro3QgyB7N8+hwXQSYE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SowqxGL3ts+KhrOYhgKNCUE7xBBFhUiNvx4v2MptZAwoyIDPZiUH4bRdLGTnba5BacXc7/ucl6M8VJ3Axkw6jYYxrBp8SQYBjWjqtjwAAgu5r/USuCZ5ioFL30s0l7BJcyHnJDDhDpHYG7t2LcBu+TK+yP4K0jneUdbL5lzVqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyhogFpr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyhogFpr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35c05d7e0e9so548621a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Mar 2026 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360562; x=1774965362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dN+aBFew5lVv09Wy89w96X5Ub28BrldukDzSxi3clfg=;
        b=kyhogFprmmzf0OnUNMoyjvgejLJXRshfO+LAYVeKQZlHzNY/XCyCLC9GjYVwoOaZK5
         nNU28tkHFbHxKquoaSW39Adxoo4UCFX+C/Tjni84o42AivU5ZKT5aKZ/PiiP2//lWt56
         9thxQCXXesHq8z4yl1SZUGjdukWhT4xl0WumwwRGj5DaFWY2ezojOKn/B7JxglUfW2jE
         9gKNjp6F8QZqQPMqQI17DPU9+ZslVH8H6ci3tdp1wntguXgWo9Ct0nla45TUuSjXXPEF
         ABIRk+z9usrqHoeBj9sdCBNKc/sEZ32Pe9QryjwQS9+QnwzZv0rBDdyzSrKMMUO7mTkT
         0l9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360562; x=1774965362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN+aBFew5lVv09Wy89w96X5Ub28BrldukDzSxi3clfg=;
        b=dQAaF/AVk8B4q2b1qGloQUb/phu25bdAFiXn32KvkMiSSEsR0etwk0Cr02FJk03Hwm
         NgzbMr3VY1o+0+JawqEJ3cY2ppyWPgIEUJf3k7VHhpPZEG2/UlvNkNxe3VUNvnYK1q2S
         3O5hYEmOjOqq1YuUMScmt6aQxAu69xoclx1eaqnOkNyVq7sCFFes/5GQV0/vkDD33pyc
         LMcznPUxQOMtCPFC1dDSVy6KkMjaN3/zbCdZ0BatFRy1h28/jAVE8B9I1E5svWLZn1dC
         9l1uHBUQTF28+l/ddzSL3QKVqqsq+w6PHmo+u/8uOTlZfeBLss18dC7DS//NigEdIe33
         Qyew==
X-Forwarded-Encrypted: i=1; AJvYcCX0XxTkuGZoy8M4vx03zvV0kSTjn17x5W5hXCN1jkVMxYJdQwhp300HGggOZFJQfk+Cm06Za1xJtPYRa6hqa87MvbCveA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXjpWcEqZQtTATDHuM8gZDxJyDxV98xBiAVOeA5oDYy8KzuSB6
	bfgPv+HTzuSeaL7AqV0fEjHpCJOJgf9zGneTgek9WNdbZhwTAufT83A5
X-Gm-Gg: ATEYQzwHj6DLedBycN8UzYuv/u31NMb+8hAJsGJdzGn2amDReZiRJWkiDwDNqnsIgG4
	beeEUxMOmpFVI3c4vrlbV6qHxLc3iVSa3ZZi0WJZHqll3CxcRudJLVI2osCTsfsq02Upfu1LbBh
	V5kj3GApbIKQcGoPwJ3Tum7a8NA7ZxD8EhAOktuQn4OglXK8EvMZ0tlC0Z2XzOJaP5pSufQRvpi
	hANA5Qjyp3RfFWsqOSCiMm5AEtC8js70uX0XxIcqxT5A9tylbcla9xDa19wnDi0SCJ9jSSTNR1e
	tT41qYDAHOWvgWChMQeB7mgppb2nLsEI2KvWC2HX8yigbLoUmMg9Jir8p3yrmsQKDDhf66Eu6xE
	99wGfT3X3BMHRf3JKjUM0WJtljB7QrXV8La5w50tL3Laqtrewc0GHlJ1yRGfqwEn7PED1Y6AEJP
	lDeQ8EjDNt5kY35OTXmxiezXw=
X-Received: by 2002:a17:90b:3c8a:b0:35b:e594:5038 with SMTP id 98e67ed59e1d1-35be5945433mr9072510a91.17.1774360562360;
        Tue, 24 Mar 2026 06:56:02 -0700 (PDT)
Received: from inspiron ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a8186efsm10357323a12.13.2026.03.24.06.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:56:02 -0700 (PDT)
Date: Tue, 24 Mar 2026 19:25:51 +0530
From: Prithvi <activprithvi@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	lukagejak5@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <20260324135551.grth7jfjyoh5krzr@inspiron>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKU7JjW3OFugHXY@ashevche-desk.local>

Sure. Also can you please guide if any testing would be required for these 
changes, or I can directly send the v3 patch?

Thanks,
Prithvi

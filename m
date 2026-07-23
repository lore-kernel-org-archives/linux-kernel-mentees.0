Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A83F23B1
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843599; cv=none; b=tulxD9Zw0ZgS6VAjfv0IvMeOYSjukICFnREWKyBEAyZ3n/DbOP5Su9eOSRVbiyCB02Z3yTpoHjAm/BC4qCZb6qHLGCntdE8BCtXrzQKqRNKrEclqf/nE9ThVRFW2fNMbywFm8vL9RImCnyzqdsRqH4mqBZg/vDnIZHVRH1Xw72w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843599; c=relaxed/simple;
	bh=CE6QbJ0Y4Qn43kigjIDwEp1Wnu9JSb5eRbdolqTw3oU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSwctxuIkYNDx0E9/NUimJj2oC9RCbkCWGVyk1FusuSWBt4MR0bv6gRIr/2opkbWdCSFtIV9h9mCwK1cCKRxOipenQOnKOo2MBW4SLQbpIhxJvHg+RQJ5WlDsx7/mWKYkClEY2js2UH6Ar2uB7+kZ57XdS7IH9w1Yn/kpdWyrHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+h+URUX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+h+URUX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4955484387cso8789285e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 14:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784843594; x=1785448394; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XR6TYjEYPo/3LPYXPQ83VOvH1XRnBdy8p/CW2F6Qy3s=;
        b=Y+h+URUXMjvD8ZjqPpaIY+ukKsgFKi+vX2zRrbnPWyVRy5MYGDUHs9MIOVz6xQreAJ
         gxWcS7iTsiMSfxTHBO+EXfXbJ8HLm5XR3SZHeecIvGWlI2yJomm7JzXxHB27sWyJ/RZG
         ow655ppcaqAQhr0tPV24tWzYrf1cVozHGJ9y2sFeup7l2/pm/fvY/9Jg4vCRA6/flBbJ
         pEE9CSrP/taf+cF7I0g0AehZt4pfFElEWAghr7eXUWCKFCLpleiNIQKGa1QjdqTzp/Cq
         ul1aVEVBlJev0obaRctUpWei+nslbeTiOysikHR6gp2Ifh+ye6aWEC9Lkr3smOrumSVM
         9ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784843594; x=1785448394;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XR6TYjEYPo/3LPYXPQ83VOvH1XRnBdy8p/CW2F6Qy3s=;
        b=S5N0hRZ0wPBnRcwQntHBrnQxiNbOc6XLMORiefqrsYkJHPCIYGV8usuxV4L0Fx0P9P
         p1k5qByHkhc7gWMjudanIQ69gYRU2dALLRTVd4VzPkJ8KjBoYfZ5Jl0zwUy1yw23nSjP
         QAqJCuKDNuOVbxec4JM2rydRC4qQ0F8sqrxIEaH5noQwri0+uk+9Ly7PuZ8rNtx5rZYw
         LDrLKuwHPidzJhvieT8gHtuawTiqQUU5w/IFz72+QHN5rpJbtN094pCN4vJNrxEOBkiL
         q2r8dcH2IA/+jCIKdTd6Lwk9ITGrNwLvl0J14Cp107hdQCdhmyLEkvdsrbPB+J7xCPLS
         IeTA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9OzhNj5dGVIyhGy2KcyeQtYdPL2pLF2h8BpJC2djEo+XBXdsGfqlj7PACxMXzQ0usNNTxj5/Wlt37wBH74jC9NU86qw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsLQ6HPFU8keZHCEdh8BHa7M40XzTAGXhXThcGJRG0bSMUjox6
	6ncOxZS7o2IHNES58QHiU689kLZp/cY1I4Nkl7P7nDKfP7/QGeVu0drA
X-Gm-Gg: AR+sD13iJOHhIy6V0fGfaPRsTgK5RbJiZZcmPqrLuBdybKbL8yoRjjdbl8ok+MBdJPA
	h2IaL+d4dJqBboSifKGqS2HWJbfLJbIogGJPBn+AHtkIpZfwiQFLxsursn5yL8qmgJZ4neMP1pV
	QKdWoTrPH1Bg/bmn6x8e8aKqY6UDOq2LM8P6goIo7EgHl5/60AZiv6thP2/tOvxHnrSYe9qZ/s/
	zdzm2y0iIyfOOfrDnmQgdEf56IEgLnw0sQW1zg5C0B0mg5puJTw7OnJFZSklalT7dxWPfT0lBiq
	3KC2xJr2x/YmxhX9WYU2LzuxSIw4Xt/kj5kJAFJVytohx4K1OPCg/sAyYOpqnjiHHJByR+NVc0y
	9H+8g4Cpny7Gm+65wu2l0XnP9DyJGGge85YhhGwdVBsISHiHG7ZuTMUVfzspIO41qLGFv22T5Uu
	L+czs5O2ZHMp6hhsGKKe4UoxUVTk3H8GVenTsl8+7UE4atsKbwKBgd3GToJJr3IAOsFvsUjbZC8
	sNz7oaXQ2jB7OFYRYyBnYT4KHO3LO92uxRTZYziMLfMilET6Qg1QespizpqGHDYPuspVuGxig65
	CZtvj9zgiEupQaxBf2Axz/QnbKK1nGHDb0KLhREH9HBePi9NxGkufzbka6QVscgI+n9Tecy0Suz
	NRQwezPHszgk=
X-Received: by 2002:adf:e18f:0:b0:47f:5b52:5579 with SMTP id ffacd0b85a97d-47f8da7f56bmr5423874f8f.18.1784843593827;
        Thu, 23 Jul 2026 14:53:13 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a6d7sm20311407f8f.2.2026.07.23.14.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:53:13 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:53:12 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, mazziesaccount@gmail.com, email@sirat.me,
 u.kleine-koenig@baylibre.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: chemical: cleanup codestyle warning
Message-ID: <20260723235312.432a895c@systembl0wer>
In-Reply-To: <20260723235139.02fdab3f@systembl0wer>
References: <20260723161040.20318-1-adinata.softwareengineer@gmail.com>
	<20260723235139.02fdab3f@systembl0wer>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 23:51:39 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Fri, 24 Jul 2026 00:10:38 +0800
> Adi Nata <adinata.softwareengineer@gmail.com> wrote:
> 
> > Reported by checkpatch:
> > FILE: drivers/iio/chemical/ccs811.c
> > 
> > WARNING: Prefer __packed over __attribute__((__packed__))
> > +} __attribute__((__packed__));  
> 
> Perhaps a nit, but I'd change the commit title to "prefer __packed"
> and the commit message to something like:
> 
> "Change instance of __attribute__((__packed__)) to __packed per
> checkpatch.pl warning.
> 
> Other than that:
> 
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

Additionally, you're missing the driver name in the subject/commit
message, it should be something like "iio: chemical: ccs811: prefer __packed"
-- 
Kind regards,
Joshua Crofts

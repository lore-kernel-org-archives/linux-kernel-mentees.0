Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4D2C1597
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Jul 2025 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752837374; cv=none; b=rhoR0+lQwDQS5AVLRWwNZooPepOsolNIOn3aDn9ZaaG027BeXe37drTVVSMYwp1PCM5nAalJjhpjZpTZ8qo0HBkG+rTwK6GxBjYWyhY99NwnjKQEavzjgXF0/egjZom9snXpHCB3fRKv70zINEQQYv1HfkfaBeidfe+y5NOMMcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752837374; c=relaxed/simple;
	bh=KAC7tKnqNw6ghQsIQoBhWab53HCnxnYmc4lm5r7+vxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKUYQnU95gYN0N8rHf6d9FmjdSzTwujw0ufX4cQjICHuT+WO8rkTpD6pbnMWc7ZhwWgvb3XhM3o0uilQKWLUHr/6puYvQchoUXWSj81go/Pk3uVzUsv+CqUodqHMnMVU/FWuS0PK25rGi/3JJ5AE04vY/w0CJLtEo6QldJp6x1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=gVJdeOtD; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="gVJdeOtD"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F8D610EC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Jul 2025 11:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4UsSczDup_W for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jul 2025 11:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=david@fromorbit.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E584610E4
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E584610E4
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gVJdeOtD
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5E584610E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Jul 2025 11:16:12 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-235ef62066eso24843205ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Jul 2025 04:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1752837371; x=1753442171; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qpf3i0yhcut+LszaoQo/We6g+NwrXQm4EMP35kSjpEQ=;
        b=gVJdeOtDoIJQUZgMBKPvjdtXZLjJkCzoONZujftPrSg2fTSBTCimgYgRLbbIY5QGbF
         K8hCvHDFCulP1MIgCIR5RudH6xl8IJvKnZZpPC8W5QN2mL+vfFaaV2uqlfvMcOZ19Tb9
         aAtrjJ4libuka8v7TseeXUbaWy62AiRzgRa1ZC8MQ7xWiPAgKwbsoN6KZuAANteXeNV/
         PTfaf8mOB6E04IxZhKZLoRFPW9s1N9ibp7mvy8+hxJXcKK8nJJetdbFUEK6oG9uGLj8u
         04VF7THYsROuSPkZMtpvXJstt3Ft1aMCAt68BUnKX99uukLIBqvTIJKJz2WGAMDfKa5G
         Bdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752837371; x=1753442171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpf3i0yhcut+LszaoQo/We6g+NwrXQm4EMP35kSjpEQ=;
        b=b1nq1D+M8KCIXhtwVZXYcxpNEoFsQIWUVfM3Hhhj9YQWWxYfNxPg9D73kQUQA3LdM/
         CcimZpoBYKRdXP67gV+5kCw+UEJaOzYkMOM0hEs+GNmcpUbwrfshoRLg+Jl1fGY+gu/u
         9HdEFvSLF3YsShen5fVaRnHfZPXbN1SJOZUAJlga9/5jCI7mYWepe/N3s1Nhanvvqa3m
         mqculXdj74lTfXu6Vf/any9bZtRQu0bDWez+BxMY6hKPFNZrE7LeHCta1F0b/lRgOSdF
         pGnKvY00WtWgxc37DMydjXVKc/xftTjs0yRC6GpbTlJVAQHbge0xbDXI6GabswEHIlLM
         0NDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK+SE1Q0kFYjLL9nSprSAgt8BUFwUzeavRQGb++J3BA7i/58/soXfqjEqTx/D07AtBu+Dr7i+w9qfP0GDDOC0TMsw76g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwMpVgBWfywHHEmMDIL0RWjXmdMf5YvfAib5YjN5bFHnx7p1pnv
	9LzTA21gbyMmIcuAH4cznlaE8eCXsct+nvapmRtH8fKz58+RR0SljfCYpNlCOITwtvAVTxa5pUd
	hpf/5
X-Gm-Gg: ASbGncssr4ZrmStp1UMXKjBP4pP1qdmXMw12HnmApNafohtWge419zF3uIIrstGQ6Ik
	CGI92hETAkrfLuIc7HkUAboykSZffoEc6W8Osrej+wVOSCfhd6zyRFQHtC0lAobCbHvtL+keMQ4
	DVl2vU6nuY88fooVvQ6upueRBsjUw1tyMTyyL2fXRiY583pb/G9bOvZsTa8gYKWE7yXaWbDAPXq
	6R3NuZ1H/yLkiU8uwd1fFrcMYdZxwxU1GCac4t1ScgM7MAe8SoMyARDuxWbFbXI09ZUeO6rEgFp
	qYZbzmQTT1YCs5QeYMmLR5BW3P7HX9IR7k6a/qr6ffVeBwSWRTyS7VbqVl3+iHyYhdt8cQyFfAA
	mJwlFEarerZxiUZALuBW0qNf0g6rV2FoRhEYDpkKIi/6bpZv3QemBm/b13SGoXe6EnYyVWAtWGg
	==
X-Google-Smtp-Source: AGHT+IH+YNkMNydCV8+ckYpqEo/rurDfmxt/BmZG9DSn518D6//2LQGAwxPczvGdppJLXJX8W68Ctw==
X-Received: by 2002:a17:903:350d:b0:234:c549:da14 with SMTP id d9443c01a7336-23e303389aamr104128795ad.29.1752837371571;
        Fri, 18 Jul 2025 04:16:11 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-64-170.pa.nsw.optusnet.com.au. [49.181.64.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ff9e964sm1016534a12.59.2025.07.18.04.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 04:16:11 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1ucj4S-0000000CZ8f-1Fgb;
	Fri, 18 Jul 2025 21:16:08 +1000
Date: Fri, 18 Jul 2025 21:16:08 +1000
From: Dave Chinner <david@fromorbit.com>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] xfs: Replace strncpy with strscpy
Message-ID: <aHos-A3d0T6qcL0o@dread.disaster.area>
References: <20250716182220.203631-1-marcelomoreira1905@gmail.com>
 <aHg7JOY5UrOck9ck@dread.disaster.area>
 <CAPZ3m_gL-K1d2r1YSZhFXmy4v3xHs5uigGOmC2TdsAAoZx+Tyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPZ3m_gL-K1d2r1YSZhFXmy4v3xHs5uigGOmC2TdsAAoZx+Tyg@mail.gmail.com>

On Thu, Jul 17, 2025 at 02:34:25PM -0300, Marcelo Moreira wrote:
> Given that the original `strncpy()` is safe and correctly implemented
> for this context, and understanding that `memcpy()` would be the
> correct replacement if a change were deemed necessary for
> non-NUL-terminated raw data, I have a question:
> 
> Do you still think a replacement is necessary here, or would you
> prefer to keep the existing `strncpy()` given its correct and safe
> usage in this context? If a replacement is preferred, I will resubmit
> a V2 using `memcpy()` instead.

IMO: if it isn't broken, don't try to fix it. Hence I -personally-
wouldn't change it.

However, modernisation and cleaning up of the code base to be
consistent is a useful endeavour. So from this perspective replacing
strncpy with memcpy() would be something I'd consider an acceptible
change.

Largely it is up to the maintainer to decide.....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

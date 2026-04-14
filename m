Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C37C1E8332
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Apr 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776147346; cv=none; b=i7BaspQCukg3Nrv7QOrN4EVBpB7oxj9RaC1LIILXUIVGWehqKrrmhdr3WfE/uA5D+iwulJ13lLDv45dd1EZ74GqSYNHW+cidDalShNf6dZYTnCDvSCDV9sicAypfTbikv5R3u1L9b9oBzseQyEkCvXpTjHxFlBffYtMSI2sBr80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776147346; c=relaxed/simple;
	bh=UB6igvCFPBsEsTpwZZL1dQgZvlFXY9qh1IJBhfoBaKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUptgFnI7qi57+Nirp/BuLZYOvetyanG8HCRppYGlHbtNp//Od0qGuszGgYkyu+kam8JjUC/uK3Y4BC1knvQb0TIw1MbbEuj2T/JTnNUQDm2/nR81XOrrtYvXBTkOcZOLe1nkJ5d2S31LvMQOPXWKTKxAb422JaiNkAhXIcaQIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfmK/3ZF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfmK/3ZF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f1f6103afso1378825b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Apr 2026 23:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776147344; x=1776752144; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kep5pupCMO+SdCzjkbNvuCXzJJsxubzVF6JFzj92rXI=;
        b=gfmK/3ZFL6x4OFhlPBLCWehL0h/EsVEQvJdcDlIGFbA6QH78B/ZWdS9Naht/eiDsb3
         d2t3g+XidZTFq4vBTIaOJOXxHT3uoiCejIoloU3xbj8aC15elrFqKZRxHmacmcuPZtdT
         mZdTnTk75CuSh6m7tyUUDF/07ZZc+jfIBjjQJrBhDI8ZbxwdQWEom2H/HgEZPLdAR1k0
         lewCRGsaWH9lFrl6ZPfGcPwXUCk4d4aCF088Wgi+9r6KEGERd4a2Q/lHJLIhtxH0tb5+
         huuFjPV1oGvqgt3t9PnGEgQGWN3rPNK2EHUlD/l1V7aOTUR6shPuBrHD6RyqUYEvG8p2
         wimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776147344; x=1776752144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kep5pupCMO+SdCzjkbNvuCXzJJsxubzVF6JFzj92rXI=;
        b=J4rSWZgNQxFh/0PP77AGN2axZ+3bbZXLcPDLXpHodaW5TMSCSEA2GS86wGqMZ1aMJj
         O+80lNkG7GzZG2Cn6wovnnEYSFDojDaNNI4VBw1PU94zrLLJ4jiz0qQUq75ETPxVkXB3
         gMXIL9yASKETBbTbzmOPBKJtXQsjKpTJqWxHSbdhkEjZPdM6Cz+mAik4JXYAwAkd1mU/
         /lK4PcXO7o0iy9Le3h+xwyLkhfiUGp4cbtPQXEwnCPuqrTOp9E2YzpKJw//FM4g587UT
         jvyvBqxX2wdZtW811UOjxPCv7C3ni3y1lkCRk5UA9YwxUwrdSA0dB2GpmGer6jrAKNCW
         6Afg==
X-Forwarded-Encrypted: i=1; AFNElJ/pBMRVJQwn/XWbwHpBo1WCVMp/YnEh+29YSEvWwba1KxyM6xU5626cmi7f3bsUbhyo2LFrG32wJWJC/8HgE3tjZKdAvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN6j71vWQpKF+MYz4rmcnApB4dwcNauEu60D+o+HUzOTMZU3L2
	WdqyzDjyUW7AnwIAkz8mQPZ8N2NW8uRE4gx0H4SxM9tKk1Cu6d3tFmAv
X-Gm-Gg: AeBDiesGkjBn9i/fhpHOookLNEnJeWX/F0tlmm2YFsKNg/LKIWaO2PJgy/fVT6jwBUN
	T3FVQKgxOJLh06YKi23UJgKXpyGN96zMSKCbuqOseSmQrQ4jL80bF8oZn+DsgdC9OrB1C09SAKu
	NjtjSKa+8c4GJVtCsL/57EeBv9QmkOLgrQ0++Dq1KMefqXn6+S1fUAcS66V35dnwSYrfYNZTpXm
	N0cZUC79U6pUUbWUc124/CVU03q3R32lZcBBvP9B9fD8nlLFoF56N+icUpqvkhe73zVyU78ALCP
	wWpksuwVv5//ampu0dVdLyESQfyywg6opLVEyF+NVt0Dd/PQKs8KiE623x5Ip+1MvTH7joOrZlD
	3WAXyeg2NEdFkPeVJmJc6mdHHqoSgJiD2B7Z12LLaz4gmN2IYvVDjKqUFbkJjDaLqnamEBIm8e4
	1TvwOOX7/AcHfK75S89ApMFRp9xtkn7M4=
X-Received: by 2002:a05:6a00:4b01:b0:82c:ebbd:9eca with SMTP id d2e1a72fcca58-82f0c26b435mr15986383b3a.11.1776147344460;
        Mon, 13 Apr 2026 23:15:44 -0700 (PDT)
Received: from inspiron ([114.79.178.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b5a79sm14016412b3a.30.2026.04.13.23.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:15:44 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:45:31 +0530
From: Prithvi <activprithvi@gmail.com>
To: andriy.shevchenko@linux.intel.com, luka.gejak@linux.dev
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com, tmimiharoen@gmail.com,
	filippo.muschera@gmail.com, ethantidmore06@gmail.com,
	rayfraytech@gmail.com, david@cardinalsystem.net, weibu@redadmin.org,
	dharanitharan725@gmail.com, ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org, karanja99erick@gmail.com,
	khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, bryant.boatright@proton.me,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260414061531.ftq43mqv7evyduc3@inspiron>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
 <20260409145045.44r4f5bleklkk4ha@inspiron>
 <2026040942-slicer-rake-4056@gregkh>
 <20260409153958.6wmjiu4jcghtyeom@inspiron>
 <D767F902-D249-4F93-A230-D432DB0423F9@linux.dev>
 <adfL8CHDT6UdKppU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfL8CHDT6UdKppU@ashevche-desk.local>

On Thu, Apr 09, 2026 at 06:55:28PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 09, 2026 at 05:44:24PM +0200, Luka Gejak wrote:
> > On April 9, 2026 5:39:58 PM GMT+02:00, Prithvi <activprithvi@gmail.com> wrote:
> > >On Thu, Apr 09, 2026 at 05:02:16PM +0200, Greg KH wrote:
> > >> On Thu, Apr 09, 2026 at 08:20:45PM +0530, Prithvi wrote:
> 
> ...
> 
> > >> But next time, trim your "who do I cc:" list, as it is _way_ too big,
> > >> how did you generate it?
> > >
> > >Understood...here I used all the email addresses generated from the 
> > >get_maintainer.pl script. Next time, I'll be sure to trim it down just to 
> > >maintainers and reviewers.
> > 
> > Upon testing myself, get_maintainer.pl doesn't list all of those 
> > people when ran on a directory or a file in staging.
> 
> Also you may check my script [1] that I use on everyday basis to send patches
> to Linux kernel. It has some heuristics that showed to be almost suitable.
> 
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 

Yes I directly ran the get_maintainer.pl script on the patches, without any 
flags due to which I got a very long 'to' and 'cc' list for the patches.

Thanks Andy for sharing the script - it is indeed optimized for this purpose :)

Best Regards,
Prithvi

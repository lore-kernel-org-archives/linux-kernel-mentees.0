Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698EB13B5A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Apr 2024 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712675979; cv=none; b=Z9tBD3D/tMFm2JjXLl0zOiWK9GeTYvcHwEAqTIuNMW17/jBJlVmXiZ8PG8Zv2gPnrrrQWS6BDuxSdPzc0QYYd2iRcje5juQjXnxxjtg8Iih5KPoNgQ7uu3ZfuSVQsF/rqbjWRqXmZXKe864mZVckmDa5fYHhNnFqKBdHO9fDKFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712675979; c=relaxed/simple;
	bh=qa4rli8S2cx06P+slXxB/kOqeXSUVhNJc+VYYce+NQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4O7hCXKlB8DD71w9Jz9xhCdZ3yK1sgcUlJoYGNk9fL8L8RMXk1Br+8ANY4kV4zUCcnD8AyxbtOYT4A1q59qVIH2ucgyENCQhp1GbmDO6rplwxD5BDy6NhE2AErkS+6/VwX463tLmYEY9+zMoz9FcVoTQF170C58ii65MQElfp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ejUTFtJ0; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ejUTFtJ0"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4AF6067F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Apr 2024 15:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p077QX8XspUV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Apr 2024 15:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1369A6063C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1369A6063C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ejUTFtJ0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1369A6063C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Apr 2024 15:19:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E8F9CE10D3;
	Tue,  9 Apr 2024 15:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64713C43390;
	Tue,  9 Apr 2024 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712675969;
	bh=qa4rli8S2cx06P+slXxB/kOqeXSUVhNJc+VYYce+NQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejUTFtJ0fc9EfF2toX//oGWQs/GwTwR9n+S2NnT7st8k62J7XuRG/nAqCBJ6cRhLB
	 iyvrrvspq7wNnk1naCosc0sy9OplKz3i3jfr0hXh4iTeHKkgBvDRVFy6UQoIP7mh5h
	 oydk9jPHD0wVRaNIXRQ0dNYF3Ci/3gzuSuAHMQN4=
Date: Tue, 9 Apr 2024 17:19:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] usb/dwc3: replace of_node_put with __free
Message-ID: <2024040953-blade-entryway-5091@gregkh>
References: <20240406024838.537630-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406024838.537630-1-andrewjballance@gmail.com>

On Fri, Apr 05, 2024 at 09:48:38PM -0500, Andrew Ballance wrote:
> this relaces instances of of_node_put with __free(device_node)
> in drivers/usb/dwc3/core.c

Why?  You need to always describe _why_ you do something, not _what_ you
do.

thanks,

greg k-h

Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A817C9AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 05:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727326804; cv=none; b=svwTGUusmnlU3J9gYJ3HzZtiBDDIEu3N1IrYbOddWuUwWae/yj9uf+/NfMDnbOKTIhsQSBZF5aelRAH6wtnqhcqF//nKi3CGK0fInw/2ueK3DO4HhQ2Fas2Kyc13DoF+g8uB6C3bAmVhC7Q2dP84ImafzHbJafvm/hBdLP/FfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727326804; c=relaxed/simple;
	bh=2XIXGD2Rn6RQu8hB0JdURTj3F2UEZ6CeicHcLbUObOI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iupGqjJ0KFegv27agpiHtqkaUL82JlMC76f0nje9lJob4vJQ8y2vg5syycjNIP8LdqjZD10cdgPk5L2o/jfpTygoWoIr/G0wB8W4W7nGqRzhjaUNayxReJtuuhgZO/Lh77HGLoULVVvjZ+aetti1roi5PSPeFdqCFn5R0DVHEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188A7607D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 05:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.342
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXyVDQCngres for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Sep 2024 05:00:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=ilqa=qy=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2AAA607CF
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2AAA607CF
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A2AAA607CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 05:00:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7F83A43969;
	Thu, 26 Sep 2024 04:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B71FC4CEC5;
	Thu, 26 Sep 2024 04:59:55 +0000 (UTC)
Date: Thu, 26 Sep 2024 00:59:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net,
 skhan@linuxfoundation.org, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] trace doc: document the device_pm_callback events
Message-ID: <20240926005952.5ba2fda4@rorschach.local.home>
In-Reply-To: <20240922132636.34413-1-0xff07@gmail.com>
References: <20240922132636.34413-1-0xff07@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


This needs an ack from one of the power management maintainers.

-- Steve


On Sun, 22 Sep 2024 21:26:28 +0800
"Yo-Jung (Leo) Lin" <0xff07@gmail.com> wrote:

> Add documentation for the device_pm_callback_{start, end} events
> under the "Subsystem Trace Points: power" section.
> 
> Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> ---
>  Documentation/trace/events-power.rst | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/trace/events-power.rst b/Documentation/trace/events-power.rst
> index f45bf11fa88d..7031954f7ed3 100644
> --- a/Documentation/trace/events-power.rst
> +++ b/Documentation/trace/events-power.rst
> @@ -102,3 +102,30 @@ And, there are events used for CPU latency QoS add/update/remove request.
>    pm_qos_remove_request     "value=%d"
>  
>  The parameter is the value to be added/updated/removed.
> +
> +5. Device PM callback events
> +============================
> +The device PM callback events are placed right before and after an invocation of
> +a device PM callback during a system-wide suspend/resume attempt.
> +::
> +
> +  device_pm_callback_start     "%s %s, parent: %s, %s[%s]"
> +  device_pm_callback_end       "%s %s, err=%d"
> +
> +The first two parameters in both events are the same. They are:
> +
> +  - The name of the driver.
> +  - The device whose PM callbacks get called.
> +
> +For device_pm_callback_start, the rest of the parameters are:
> +
> +  - The parent device of the device (if any).
> +  - Level in the power management hierarchy the callback belongs to (e.g. power
> +    domain, type, class, bus, driver). Some stages (e.g. early, late, noirq)
> +    will also be explicitly mentioned in this string.
> +  - The ongoing PM event. You may find definitions of those events in the
> +    PM_EVENT_* macros in include/linux/pm.h
> +
> +For device_pm_callback_end, the only remaining parameter is:
> +
> +  - The return value of the PM callback.


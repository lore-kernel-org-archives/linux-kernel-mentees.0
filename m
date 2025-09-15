Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8982BD022
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 21:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757973600; cv=none; b=sFESbMNmCmdT4JJ9I8D4HMl6CtIEcz5PEfXtUcwv1dgAgrYreATHMFvAJ+0GU8O6QsJgSaMLi+feGyLAkr9NSOOJ3AvkRsTts8zS1VxE7m6vChBXzGGe/lrxtNFMsAtRBKe0m4eUQujF81cEuxW+BdNSAy4wENOmIdcZxj28eC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757973600; c=relaxed/simple;
	bh=n48jciww2X0fn0vaR7T+mpGEYCvSTNzQI6VrrkWGUHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2MjXlP3x6sW/+ngDMXfSp1MDx6kOIlntVRYc3FIvGwE1ml7sY4HtequggmFp42gKERdnchUBqAapQNvlgfb2jzORJJRDqF3t/vUlecxSxMLb0x6OxKxUr68s8TqZPzrwt3g5a7xuTpmFwPP3lqGTmXti9PlfUE7fCIvB9k7U7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=r8xPu+E2; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="r8xPu+E2"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F2CD409A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 21:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.488
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyapmHbNRMVP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Sep 2025 21:59:57 +0000 (UTC)
X-Greylist: delayed 326 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 15 Sep 2025 21:59:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B020140923
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B020140923
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=r8xPu+E2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=w_armin@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B020140923
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1757973594; x=1758578394; i=w_armin@gmx.de;
	bh=E6hgzD5Pj/WlFlOBbRw7Y6W8q2wyU02oCUPJafOdY+o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=r8xPu+E22yVR2LJuQap5cRtDWV/7NCTiWgMBx1QWRzNv0lhbNScCROVvDiZ9XXBy
	 40L0nxaMMj2waTcW8RSHR42fNaQHJw29gCD7d6w7cMSwvByrEpqwEQQm69294WOWK
	 kXK2RXJMkntFIwWRv1zXis88lWiYeNUYLD2FkqcQUBt3d1+0+lf3NoKjiJm9HQH9e
	 0J1GSt1WhzUdcj95ZV6RITVcrhb9leuwCIVoOnQCiUxwudoBmhDap1Yxz+V94pBOt
	 st5r69ceTcaxRJi9Hyl8z986TQerTP0bbbWZ3sK8m+N+wg6DCMYjR0UcCD+is+2RV
	 bBB3hCPs9NV5t1O0zA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1uIAfF3jDb-015RoQ; Mon, 15
 Sep 2025 23:54:27 +0200
Message-ID: <cfd7977e-d612-4e08-a68a-65fed8e164b6@gmx.de>
Date: Mon, 15 Sep 2025 23:54:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/wmi: Fix Typo in lenovo-wmi-gamezone
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: rakuram <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250817170644.5855-1-rakuram.e96@gmail.com>
 <31b895a4-edd0-4ce5-a20a-7d0fb67e9721@app.fastmail.com>
 <444b64a7-631e-4acf-d2c8-2f0acd379d61@linux.intel.com>
 <4d218ba7-71ba-4dfe-9a6f-a1997345c35a@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <4d218ba7-71ba-4dfe-9a6f-a1997345c35a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K5DiFh4BcFNZ2fXX030eACasbxJBIdVF2QKAQt4aEhqpEG+Fmx4
 Vvs8dkbUTh65FVYl+hhLQshvt0ndbWyEa85H/9tRqNl+NTH4o0CpBeXL06y5C7AidtqYUjG
 JuHXyM3PwuV7zF6ZmCaWHbt9dTXmZdeuV0Eg2cMOZnBohB1YdFlAf08ZkgYQN5RSz/LOEak
 eKHw8db81B18kIUfniaXw==
UI-OutboundReport: notjunk:1;M01:P0:VWQ9HHha+NE=;23jmw3UwTVJKd2/kjv2++iwe+Sd
 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

Am 15.09.25 um 20:23 schrieb Mark Pearson:

> Hi Ilpo,
>
> On Mon, Sep 15, 2025, at 6:32 AM, Ilpo J=C3=A4rvinen wrote:
>> On Wed, 20 Aug 2025, Mark Pearson wrote:
>>> On Sun, Aug 17, 2025, at 1:06 PM, rakuram wrote:
>>>> Fixed the below typo error
>>>>
>>>> freqency =3D=3D> frequency
>>>> in Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>>
>>>> Signed-off-by: rakuram <rakuram.e96@gmail.com>
>>>> ---
>>>>   Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>> b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>> index 997263e51a7d..22040250a97d 100644
>>>> --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>> +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>> @@ -153,7 +153,7 @@ data using the `bmfdec
>>>> <https://github.com/pali/bmfdec>`_ utility:
>>>>       [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateI=
D;
>>>>       [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
>>>>       [WmiDataId(3), read, Description("Default value.")] uint32
>>>> defaultvalue;
>>>> -    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32
>>>> OCOffsetFreq;
>>>> +    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32
>>>> OCOffsetFreq;
>>>>       [WmiDataId(5), read, Description("OC Min offset value.")] uint3=
2
>>>> OCMinOffset;
>>>>       [WmiDataId(6), read, Description("OC Max offset value.")] uint3=
2
>>>> OCMaxOffset;
>>>>       [WmiDataId(7), read, Description("OC Offset Scale.")] uint32
>>>> OCOffsetScale;
>>>> --=20
>>>> 2.43.0
>>> Looks good to me.
>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Hi,
>>
>> Isn't the typo in the original interface as well? I'm not very keen in
>> accepting this kind of patches as this part is not really user
>> documentation to begin with.
>>
> I haven't had a chance to double check - but it's kinda bad that we had =
that typo in the original implementation to be honest. I can ask to get th=
at fixed, but it will likely take a long time for something minor.
> I defer to you on the preference for kernel documentation - I suspect we=
'll get a bunch of these though (part of the 'getting started to contribut=
ing to the kernel' is always typos and documentation right?).
>
> Mark

I agree, the typo is inside the WMI MOF definition which is included insid=
e the documentation for future developers. Since this MOF definition shoul=
d
match the actual MOF definition reported by the ACPI firmware, i suggest t=
hat we ignore any spelling mistakes inside those.

Thanks,
Armin Wolf


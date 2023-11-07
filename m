Received: from 6.mo576.mail-out.ovh.net (6.mo576.mail-out.ovh.net [46.105.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2E38A
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Nov 2023 17:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.146.50])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id B94A42D819
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Nov 2023 17:26:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xkfc9 (unknown [10.109.138.121])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6B5531FDBB;
	Tue,  7 Nov 2023 17:26:11 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
	by ghost-submission-6684bf9d7b-xkfc9 with ESMTPSA
	id HPouDjNzSmXyXQEAGls1mg
	(envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 17:26:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 19:26:10 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Guenter Roeck <linux@roeck-us.net>
Cc: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, skhan@linuxfoundation.org, airlied@gmail.com,
 daniel@ffwll.ch, jdelvare@suse.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/amd/pm: clean up redundant comparisons with 0
In-Reply-To: <98e8490e-6608-47a8-890c-f1fe894dac7f@roeck-us.net>
References: <20231107082910.92508-1-jose.pekkarinen@foxhound.fi>
 <98e8490e-6608-47a8-890c-f1fe894dac7f@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <65d132b0dbef66039fd6938ecbc2bf68@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.102.4
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8301260013758293697
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddujedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvvddtrddutddvrdegpdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht

On 2023-11-07 16:08, Guenter Roeck wrote:
> On 11/7/23 00:29, José Pekkarinen wrote:
>> There is a couple of function return checks of functions that return
>> unsigned values, and local variables to hold them are also unsigned, 
>> so
>> checking if they are negative will always return false. This patch 
>> will
>> remove them, as well as the never reached code.
>> 
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2801:5-8: WARNING: Unsigned 
>> expression compared with zero: val < 0
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2814:5-8: WARNING: Unsigned 
>> expression compared with zero: val < 0
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> ---
>>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ----
>>   1 file changed, 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c 
>> b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> index 8bb2da13826f..e7bb1d324084 100644
>> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> @@ -2798,8 +2798,6 @@ static ssize_t 
>> amdgpu_hwmon_show_power_avg(struct device *dev,
>>   	unsigned int val;
>>     	val = amdgpu_hwmon_get_power(dev, 
>> AMDGPU_PP_SENSOR_GPU_AVG_POWER);
>> -	if (val < 0)
>> -		return val;
>> 
> 
> This is reporting errors returned from amdgpu_hwmon_get_power() as
> large integers.

     Alright, that case it is a false positive, thanks for the comment!

     José.

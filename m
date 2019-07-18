From: rjw at rjwysocki.net (Rafael J. Wysocki)
Date: Thu, 18 Jul 2019 10:36:57 +0200
Subject: [Linux-kernel-mentees] [PATCH] thermal: intel: int340x_thermal:
	Remove unnecessary acpi_has_method() uses
In-Reply-To: <20190717192639.90092-1-skunberg.kelsey@gmail.com>
References: <20190717192639.90092-1-skunberg.kelsey@gmail.com>
Message-ID: <1780280.CEgozTfreW@kreacher>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wednesday, July 17, 2019 9:26:39 PM CEST Kelsey Skunberg wrote:
> acpi_evaluate_object() will already return in error if the method does not
> exist. Checking if the method is absent before the acpi_evaluate_object()
> call is not needed. Remove acpi_has_method() calls to avoid additional
> work.
> 
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>

LGTM:

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki at intel.com>

> ---
>  drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> index 9716bc3abaf9..7130e90773ed 100644
> --- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> +++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> @@ -77,9 +77,6 @@ int acpi_parse_trt(acpi_handle handle, int *trt_count, struct trt **trtp,
>  	struct acpi_buffer element = { 0, NULL };
>  	struct acpi_buffer trt_format = { sizeof("RRNNNNNN"), "RRNNNNNN" };
>  
> -	if (!acpi_has_method(handle, "_TRT"))
> -		return -ENODEV;
> -
>  	status = acpi_evaluate_object(handle, "_TRT", NULL, &buffer);
>  	if (ACPI_FAILURE(status))
>  		return -ENODEV;
> @@ -158,9 +155,6 @@ int acpi_parse_art(acpi_handle handle, int *art_count, struct art **artp,
>  	struct acpi_buffer art_format =	{
>  		sizeof("RRNNNNNNNNNNN"), "RRNNNNNNNNNNN" };
>  
> -	if (!acpi_has_method(handle, "_ART"))
> -		return -ENODEV;
> -
>  	status = acpi_evaluate_object(handle, "_ART", NULL, &buffer);
>  	if (ACPI_FAILURE(status))
>  		return -ENODEV;
> 
